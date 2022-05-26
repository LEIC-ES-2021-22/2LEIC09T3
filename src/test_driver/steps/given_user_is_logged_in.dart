import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';


StepDefinitionGeneric GivenUserIsLoggedInStep(String username, String password) {
  return given<FlutterWorld>(
    'the user is logged in to uni',
        (context) async {
          final isLoggedIn = await FlutterDriverUtils.isAbsent(
            context.world.driver,
            find.byValueKey('login_button'),
          );

          if (!isLoggedIn) {
            await FlutterDriverUtils.enterText(
              context.world.driver, 
              find.byValueKey('login_username'),
              username
            );

            await FlutterDriverUtils.enterText(
              context.world.driver, 
              find.byValueKey('login_password'),
              password
            );

            await FlutterDriverUtils.tap(
              context.world.driver,
              find.byValueKey('login_button')
            );

            await FlutterDriverUtils.isAbsent(
              context.world.driver,
              find.byValueKey('login_button')
            );
          }
    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}
