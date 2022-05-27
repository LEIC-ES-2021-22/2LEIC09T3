import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'dart:io';
void debugDiagnostics(Object diagnostics, { int indent = 0 }) {

  void debug(String message) {
    for (int i = 0; i < indent; i++) {
      stdout.write('  ');
    }

    stdout.write(message);
    stdout.write('\n');
  }

  if (diagnostics is Map) {
    for (final key in diagnostics.keys) {
      final value = diagnostics[key];
      if (value is List) {
        if (value.isEmpty) {
          debug('$key: [],');
        } else {
          debug('$key: [');
          debugDiagnostics(value, indent: indent + 1);
          debug('],');
        }
      } else if (value is Map) {
        if (value.isEmpty) {
          debug('$key: {},');
        } else {
          debug('$key: {');
          debugDiagnostics(value, indent: indent + 1);
          debug('},');
        }
      } else {
        debug('$key: $value,');
      }
    }
  } else if (diagnostics is List) {
    for (final value in diagnostics) {
      if (value is List) {
        if (value.isEmpty) {
          debug('[],');
        } else {
          debug('[');
          debugDiagnostics(value, indent: indent + 1);
          debug('],');
        }
      } else if (value is Map) {
        if (value.isEmpty) {
          debug('{},');
        } else {
          debug('{');
          debugDiagnostics(value, indent: indent + 1);
          debug('},');
        }
      } else {
        debug('$value,');
      }
    }
  } else {
    debug('$diagnostics');
  }
}

StepDefinitionGeneric GivenUserHasUnreadNotifications() {
  return given1<String, FlutterWorld>(
    RegExp(r"the user (has|doesn't have) unread notifications"),
        (predicate, context) async {
            final has = predicate == 'has';

            final finder = await FlutterDriverUtils.isPresent(
              context.world.driver, 
              find.byValueKey('notifications_button_active'),
              timeout: Duration(seconds: 5),
            );

            if (finder) {
                await FlutterDriverUtils.tap(
                context.world.driver,
                find.byValueKey('notifications_button_active'),
                timeout: const Duration(seconds: 10),
              );
            } else {
              await FlutterDriverUtils.tap(
                context.world.driver,
                find.byValueKey('notifications_button_inactive'),
                timeout: const Duration(seconds: 10),
              ); 
            }

            var hasUnreadNotifications = false;
            int i = 0;

            while (!hasUnreadNotifications && await FlutterDriverUtils.isPresent(
              context.world.driver,
              find.byValueKey('slidable_notification_$i'),
              timeout: const Duration(seconds: 10)
            )) {
              sleep(Duration(seconds: 5));

              await context.world.driver.scroll(
                find.byValueKey('slidable_notification_$i'),
                500, 0, const Duration(seconds: 1), timeout: const Duration(seconds: 10)
              );

              hasUnreadNotifications = await FlutterDriverUtils.isPresent(
                context.world.driver, 
                find.text('Marcar como lida'),
                timeout: const Duration(seconds: 5)
              );

              i++;
            }

            await FlutterDriverUtils.tap(
              context.world.driver,
              find.byValueKey('home_button'),
              timeout: const Duration(seconds: 10)
            );

            context.expectMatch(hasUnreadNotifications, has);
    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}
