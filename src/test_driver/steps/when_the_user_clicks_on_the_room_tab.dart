import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric WhenTheUserClicksOnTheRoomTab() {
  return when<FlutterWorld>('the user clicks on the room tab', (context) async {
    sleep(Duration(seconds: 5));
    
    await FlutterDriverUtils.tap(context.world.driver, find.byValueKey('room-page'), timeout: Duration(seconds: 10));
  },
      configuration: StepDefinitionConfiguration()
        ..timeout = const Duration(days: 1));
}
