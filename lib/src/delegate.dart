import 'package:flutter/material.dart';
import 'loader.dart';
import 'service.dart';

class localizationSheet {
  final Locale locale;
  final Map<String, String> _translations;

  localizationSheet(this.locale, this._translations);

  String translate(String key) => _translations[key] ?? key;

  static localizationSheet of(BuildContext context) =>
      Localizations.of<localizationSheet>(context, localizationSheet)!;
}

class LocalizationSheetDelegate extends LocalizationsDelegate<localizationSheet> {
  final String sheetUrl;
  final Duration cacheDuration;

  const LocalizationSheetDelegate({
    required this.sheetUrl,
    this.cacheDuration = const Duration(hours: 24),
  });

  @override
  bool isSupported(Locale locale) => ['uz', 'en', 'ru'].contains(locale.languageCode);

  @override
  Future<localizationSheet> load(Locale locale) async {
    final loader = RemoteLocalizationLoader(
      sheetCsvUrl: sheetUrl,
      locale: locale.languageCode,
      cacheDuration: cacheDuration,
    );
    final translations = await loader.loadTranslations();
    RemoteTranslationService.instance.load(translations);
    return localizationSheet(locale, translations);
  }

  @override
  bool shouldReload(LocalizationsDelegate<localizationSheet> old) => false;
}
