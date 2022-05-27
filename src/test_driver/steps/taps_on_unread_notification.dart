import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric TapsOnUnread() {
  return when<FlutterWorld>(
    'the user slides a notification to the right and taps on "Marcar como lida"',
    (context) async {

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

      int i = 0;

      while (await FlutterDriverUtils.isPresent(
        context.world.driver,
        find.byValueKey('slidable_notification_${i}'),
        timeout: const Duration(seconds: 10)
      )) {
        sleep(Duration(seconds: 5));

        await context.world.driver.scroll(
          find.byValueKey('slidable_notification_${i}'),
          500, 0, const Duration(seconds: 1), timeout: const Duration(seconds: 10)
        );

        if (await FlutterDriverUtils.isPresent(
          context.world.driver, 
          find.text('Marcar como lida'),
          timeout: const Duration(seconds: 2),
          )) {
            await FlutterDriverUtils.tap(
              context.world.driver, 
              find.text('Marcar como lida'),
              timeout: const Duration(seconds: 2),
            );
          }

          i++;
      }

    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}