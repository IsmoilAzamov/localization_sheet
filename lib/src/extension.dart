import 'package:localization_sheet/src/service.dart';

extension TranslateExtension on String {
  String tr({List<String> args = const []}) {
    String value = RemoteTranslationService.instance.translate(this);
    for (int i = 0; i < args.length; i++) {
      value = value.replaceAll('{$i}', args[i]);
    }
    return value;
  }
}
