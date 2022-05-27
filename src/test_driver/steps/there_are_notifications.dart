import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric ThereAreNotifications() {
  return given<FlutterWorld>(
    'there are notifications',
    (context) async {
      final bool finder = await FlutterDriverUtils.isPresent(
        context.world.driver, 
        find.byValueKey('slidable_notification_0'),
        timeout: const Duration(seconds: 30),
      );

      context.expect(finder, true);
    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}