import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';


StepDefinitionGeneric WhenUserHasUnreadNotifications() {
  return given1<String, FlutterWorld>(
    RegExp(r"the user (has|doesn't have) unread notifications"),
        (predicate, context) async {
          final has = predicate == 'has';

          final hasUnreadNotifications = await FlutterDriverUtils.isPresent(
            context.world.driver,
            find.text(String.fromCharCode(0xe450))
          );

          context.expect(has, hasUnreadNotifications);
    },
  );
}
