import 'package:flutter_test/flutter_test.dart';
import 'package:localization_sheet/localization_sheet.dart';

void main() {
  test('translation fallback test', () {
    RemoteTranslationService.instance.load({'welcome': 'Xush kelibsiz'});
    expect('welcome'.tr(), 'Xush kelibsiz'); // if context is null, fallback
  });
}
