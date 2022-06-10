import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric AndUserInOnRoomPage() {
  return and<FlutterWorld>('the user is on the room page', (context) async {
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
