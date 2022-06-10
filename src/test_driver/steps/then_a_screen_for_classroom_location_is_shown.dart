/* then a screen showing the classroom's location is shown*/

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric ThenTheClassroomsLocationIsShown() {
  return then<FlutterWorld>(
      'a screen for seeing where that classroom is located should be shown to the user',
      (context) async {
    final finder = await FlutterDriverUtils.isPresent(
      context.world.driver,
      find.byValueKey('floor-page'),
      timeout: const Duration(seconds: 30),
    );

    context.expect(finder, true);
  },
      configuration: StepDefinitionConfiguration()
        ..timeout = const Duration(days: 1));
}
