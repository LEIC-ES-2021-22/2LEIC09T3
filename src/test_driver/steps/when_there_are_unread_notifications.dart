import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';


StepDefinitionGeneric GivenUserHasUnreadNotifications() {
  return given1<String, FlutterWorld>(
    RegExp(r"the user (has|doesn't have) unread notifications"),
        (predicate, context) async {
            final has = predicate == 'has';

            await FlutterDriverUtils.tap(
              context.world.driver,
              find.byValueKey('notifications_button'),
            );

            // FIXME: why this no work?
            final hasUnreadNotifications = await FlutterDriverUtils.isPresent(
              context.world.driver, 
              find.text('Marcar como lida'),
            );

            print(hasUnreadNotifications);
            context.expect(has, hasUnreadNotifications);
    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}
