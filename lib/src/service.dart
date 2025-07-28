class RemoteTranslationService {
  static final RemoteTranslationService instance = RemoteTranslationService._();

  RemoteTranslationService._();

  late Map<String, String> _translations;

  void load(Map<String, String> map) {
    _translations = map;
  }

  String translate(String key) {
    return _translations[key] ?? key;
  }
}
