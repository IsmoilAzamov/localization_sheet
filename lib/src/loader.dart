import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RemoteLocalizationLoader {
  final String sheetCsvUrl;
  final String locale;
  final Duration cacheDuration;

  RemoteLocalizationLoader({
    required this.sheetCsvUrl,
    required this.locale,
    this.cacheDuration = const Duration(hours: 24),
  });

  Future<Map<String, String>> loadTranslations({bool forceUpdate = false}) async {
    final prefs = await SharedPreferences.getInstance();
    final cacheKey = 'translations_$locale';
    final lastFetchKey = 'lastFetch_$locale';
    final now = DateTime.now();

    final lastFetchStr = prefs.getString(lastFetchKey);
    final lastFetch = lastFetchStr != null ? DateTime.tryParse(lastFetchStr) : null;

    if (!forceUpdate && lastFetch != null && now.difference(lastFetch) < cacheDuration) {
      final cached = prefs.getString(cacheKey);
      if (cached != null) return Map<String, String>.from(jsonDecode(cached));
    }

    final response = await http.get(Uri.parse(sheetCsvUrl));
    if (response.statusCode != 200) throw Exception("Failed to fetch sheet");

    final csvContent = utf8.decode(response.bodyBytes);
    final lines = const LineSplitter().convert(csvContent);
    final headers = lines.first.split(',');

    final Map<String, Map<String, String>> data = {
      for (final lang in headers.skip(1)) lang.trim(): {}
    };

    for (var i = 1; i < lines.length; i++) {
      final row = lines[i].split(',');
      final key = row[0].trim();
      for (var j = 1; j < row.length; j++) {
        final lang = headers[j].trim();
        if (j < row.length) {
          data[lang]![key] = row[j].trim();
        }
      }
    }

    final translations = data[locale] ?? {};
    prefs.setString(cacheKey, jsonEncode(translations));
    prefs.setString(lastFetchKey, now.toIso8601String());

    return translations;
  }
}
