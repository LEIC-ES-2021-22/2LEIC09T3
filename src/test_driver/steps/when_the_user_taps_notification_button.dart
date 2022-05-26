import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric WhenUserTapsNotifButton() {
  return when1<String, FlutterWorld>(
    RegExp(r'the user taps the {string} button'),
    (key, context) async {
      await FlutterDriverUtils.tap(
        context.world.driver, 
        find.byValueKey('${key}_button'),
        timeout: const Duration(seconds: 30),
      );
    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}
