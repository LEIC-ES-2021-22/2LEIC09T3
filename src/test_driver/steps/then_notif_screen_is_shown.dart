import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric ThenNotifScreenIsShown() {
  return then<FlutterWorld>(
    'a screen for seeing their notifications should be shown to the user',

    (context) async {

      final finder = await FlutterDriverUtils.isPresent(
        context.world.driver, 
        find.text('Notificações'),
        timeout: const Duration(seconds: 30)
      );

      context.expect(true, finder);
    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}