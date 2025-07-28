import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_sheet/localization_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _changeLocale(Locale locale) {
    setState(() => _locale = locale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      supportedLocales: const [Locale('en'), Locale('es'), Locale('uz')],
      localizationsDelegates: [
        LocalizationSheetDelegate(
          sheetUrl: 'https://docs.google.com/spreadsheets/d/YOUR_SHEET_ID/export?format=csv',
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: HomePage(onLocaleChange: _changeLocale),
    );
  }
}

class HomePage extends StatelessWidget {
  final void Function(Locale) onLocaleChange;
  const HomePage({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('app_title'.tr())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('welcome'.tr(), style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => onLocaleChange(const Locale('en')),
                  child: const Text('English'),
                ),
                ElevatedButton(
                  onPressed: () => onLocaleChange(const Locale('es')),
                  child: const Text('Spanish'),
                ),
                ElevatedButton(
                  onPressed: () => onLocaleChange(const Locale('uz')),
                  child: const Text('Uzbek'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
