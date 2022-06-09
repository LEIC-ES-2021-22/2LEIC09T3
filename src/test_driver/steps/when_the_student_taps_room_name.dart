/* when the user taps a room name */

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric WhenUserTapsRoomName() {
  return when<FlutterWorld>('the user taps on the room name on a class widget',
      (context) async {
    await FlutterDriverUtils.tap(
      context.world.driver,
      find.byValueKey('drawer_item_Horário'),
      timeout: const Duration(seconds: 30),
    );

    await FlutterDriverUtils.tap(
      context.world.driver,
      find.byValueKey('schedule-page-tab-2'),
      timeout: const Duration(seconds: 30),
    );

    await FlutterDriverUtils.tap(
      context.world.driver,
      find.byValueKey('schedule-page-tab-1'),
      timeout: const Duration(seconds: 30),
    );

    for (int i = 0; i < 5; i++) {
      await FlutterDriverUtils.tap(
        context.world.driver,
        find.byValueKey('schedule-page-tab-$i'),
        timeout: const Duration(seconds: 30),
      );

      final finder = await FlutterDriverUtils.isPresent(
        context.world.driver,
        find.byValueKey('lecture-0'),
        timeout: const Duration(seconds: 5),
      );

      final anotherFinder = await FlutterDriverUtils.isPresent(
        context.world.driver,
        find.byValueKey('lecture-0-room'),
        timeout: const Duration(seconds: 5),
      );

      if (anotherFinder) {
        await FlutterDriverUtils.tap(
          context.world.driver,
          find.byValueKey('lecture-0-room'),
          timeout: const Duration(seconds: 30),
        );
        break;
      }
    }
  },
      configuration: StepDefinitionConfiguration()
        ..timeout = const Duration(days: 1));
}
