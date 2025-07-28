# 🌍 localization_sheet

Remote localization made simple — fetch translations from Google Sheets, cache them locally, and access them via `.tr(context)` syntax, all while respecting Flutter’s `locale` system.

[![Pub Version](https://img.shields.io/pub/v/localization_sheet.svg)](https://pub.dev/packages/localization_sheet)
[![Flutter](https://img.shields.io/badge/flutter-ready-blue)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](LICENSE)

---

## ✨ Features

- ✅ **Remote translation** from Google Sheets (CSV export)
- 🧠 **Automatic caching** with `SharedPreferences`
- 🌐 **Locale-aware**: tied to `MaterialApp.locale`
- 🧩 Simple syntax: `'key'.tr(context)`
- 🛠 Easily extendable, lightweight and offline-friendly

---

## 🚀 Quick Start

### 1. Add dependency

```yaml
dependencies:
  localization_sheet: ^0.0.1
  flutter_localizations:
    sdk: flutter
