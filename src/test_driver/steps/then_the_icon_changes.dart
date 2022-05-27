import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';


StepDefinitionGeneric ThenTheIconIsDifferentStep() {
  return then<FlutterWorld>(
    'a badge on the notifications button is displayed',

    (context) async {
      final finder = await FlutterDriverUtils.isPresent(
        context.world.driver, 
        find.byValueKey('notifications_button_active'),
        timeout: const Duration(seconds: 30)
      );

      context.expect(finder, true);
    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}