/* then a screen showing the classroom's zoomed location is shown*/

import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric ThenTheClassroomsZoomedLocationIsShown() {
  return then<FlutterWorld>(
      'a screen for seeing that classrooms zoomed location should be shown to the user',
      (context) async {
    sleep(Duration(seconds: 10));
    final finder = await FlutterDriverUtils.isPresent(
      context.world.driver,
      find.byValueKey('room-map'),
      timeout: const Duration(seconds: 30),
    );

    context.expect(finder, true);
  },
      configuration: StepDefinitionConfiguration()
        ..timeout = const Duration(days: 1));
}
