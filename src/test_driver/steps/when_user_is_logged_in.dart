import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';


StepDefinitionGeneric WhenUserIsLoggedInStep() {
  return given<FlutterWorld>(
    'the user is logged in to uni',
        (context) async {
          final isLoggedIn = await FlutterDriverUtils.isAbsent(
            context.world.driver,
            find.byValueKey('login_button')
          );

          context.expect(isLoggedIn, true);
    },
  );
}
