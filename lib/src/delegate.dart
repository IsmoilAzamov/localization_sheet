import 'package:flutter/material.dart';
import 'loader.dart';
import 'service.dart';

class EasySheetLocalizations {
  final Locale locale;
  final Map<String, String> _translations;

  EasySheetLocalizations(this.locale, this._translations);

  String translate(String key) => _translations[key] ?? key;

  static EasySheetLocalizations of(BuildContext context) =>
      Localizations.of<EasySheetLocalizations>(context, EasySheetLocalizations)!;
}

class EasySheetDelegate extends LocalizationsDelegate<EasySheetLocalizations> {
  final String sheetUrl;
  final Duration cacheDuration;

  const EasySheetDelegate({
    required this.sheetUrl,
    this.cacheDuration = const Duration(hours: 24),
  });

  @override
  bool isSupported(Locale locale) => ['uz', 'en', 'ru'].contains(locale.languageCode);

  @override
  Future<EasySheetLocalizations> load(Locale locale) async {
    final loader = RemoteLocalizationLoader(
      sheetCsvUrl: sheetUrl,
      locale: locale.languageCode,
      cacheDuration: cacheDuration,
    );
    final translations = await loader.loadTranslations();
    RemoteTranslationService.instance.load(translations);
    return EasySheetLocalizations(locale, translations);
  }

  @override
  bool shouldReload(LocalizationsDelegate<EasySheetLocalizations> old) => false;
}
