# 🌍 localization_sheet

Remote localization made simple — fetch translations from Google Sheets, cache them locally, and access them via `.tr()` syntax, all while respecting Flutter’s `locale` system.

[![Pub Version](https://img.shields.io/pub/v/localization_sheet.svg)](https://pub.dev/packages/localization_sheet)
[![Flutter](https://img.shields.io/badge/flutter-ready-blue)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](LICENSE)

---

## ✨ Features

- ✅ **Remote translation** from Google Sheets (CSV export)
- 🧠 **Automatic caching** with `SharedPreferences`
- 🌐 **Locale-aware**: tied to `MaterialApp.locale`
- 🧩 Simple syntax: `'key'.tr()`
- 🛠 Easily extendable, lightweight and offline-friendly

---
## 🧾 Example Google Sheet Format

Here’s how your Google Sheet should look (exported as CSV):

![Sheet Example](https://raw.githubusercontent.com/IsmoilAzamov/localization_sheet/master/images/sheet_example.png)


## 🚀 Quick Start

### 1. Add dependency

```yaml
dependencies:
  localization_sheet: ^0.0.3
  flutter_localizations:
    sdk: flutter
