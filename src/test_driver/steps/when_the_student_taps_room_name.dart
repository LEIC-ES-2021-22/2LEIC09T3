/* when the user taps a room name */

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric WhenUserTapsRoomName() {
  return when<FlutterWorld>('the user taps on the room name on a class widget',
      (context) async {
    final finder = await FlutterDriverUtils.isPresent(
      context.world.driver,
      find.text('B001'),
      timeout: const Duration(seconds: 5),
    );

    if (finder) {
      await FlutterDriverUtils.tap(
        context.world.driver,
        find.text('B001'),
        timeout: const Duration(seconds: 30),
      );
    } else {
      await FlutterDriverUtils.tap(
        context.world.driver,
        find.text('B305'),
        timeout: const Duration(seconds: 30),
      );
    }
  },
      configuration: StepDefinitionConfiguration()
        ..timeout = const Duration(days: 1));
}
