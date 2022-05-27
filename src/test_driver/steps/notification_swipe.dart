import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric SwipeAndTapNotification() {
  return when<FlutterWorld>(
    'the user swipes a notification to the left',
    (context) async {

      while (await FlutterDriverUtils.isPresent(
        context.world.driver,
        find.byValueKey('slidable_notification_0'),
        timeout: const Duration(seconds: 10)
      )) {
        sleep(Duration(seconds: 5));

        await context.world.driver.scroll(
          find.byValueKey('slidable_notification_0'),
          -500, 0, const Duration(seconds: 1), timeout: const Duration(seconds: 10)
        );

        await FlutterDriverUtils.tap(
          context.world.driver, 
          find.byValueKey('notifications_delete'),
          timeout: const Duration(seconds: 2),
        );
      }

    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}