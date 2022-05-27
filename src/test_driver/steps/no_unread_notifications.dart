import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric NoUnreadNotifications() {
  return then<FlutterWorld>(
    'the notification is marked as read',
    (context) async {

      var hasUnreadNotifications = false;
      int i = 0;

      while (!hasUnreadNotifications && await FlutterDriverUtils.isPresent(
        context.world.driver,
        find.byValueKey('slidable_notification_${i}'),
        timeout: const Duration(seconds: 10)
      )) {
        sleep(Duration(seconds: 5));

        await context.world.driver.scroll(
          find.byValueKey('slidable_notification_${i}'),
          500, 0, const Duration(seconds: 1), timeout: const Duration(seconds: 10)
        );

        hasUnreadNotifications = await FlutterDriverUtils.isPresent(
          context.world.driver, 
          find.text('Marcar como lida'),
          timeout: const Duration(seconds: 5)
        );

        i++;
      }

      context.expect(hasUnreadNotifications, false);
    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}