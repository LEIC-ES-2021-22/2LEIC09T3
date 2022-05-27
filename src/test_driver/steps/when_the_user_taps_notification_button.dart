import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric WhenUserTapsNotifButton() {
  return when1<String, FlutterWorld>(
    RegExp(r'the user taps the {string} button'),
    (key, context) async {
      
      final finder = await FlutterDriverUtils.isPresent(
        context.world.driver, 
        find.byValueKey('notifications_button_active'),
        timeout: const Duration(seconds: 5),
      );

      if (finder) {
          await FlutterDriverUtils.tap(
          context.world.driver,
          find.byValueKey('notifications_button_active'),
          timeout: const Duration(seconds: 30),
        );
      } else {
        await FlutterDriverUtils.tap(
          context.world.driver,
          find.byValueKey('notifications_button_inactive'),
          timeout: const Duration(seconds: 30),
        );
      }

    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}
