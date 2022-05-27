import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric UserIsOnNotificationsScreen() {
  return given<FlutterWorld>(
    'the user is on the notifications screen',
    (context) async {
      await FlutterDriverUtils.tap(
        context.world.driver,
        find.byValueKey('notifications_button'),
        timeout: const Duration(seconds: 30),
      );

      bool finder = await FlutterDriverUtils.isPresent(
        context.world.driver,
        find.text('Notificações'),
        timeout: const Duration(seconds: 30),
      );

      context.expect(true, finder);
    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}