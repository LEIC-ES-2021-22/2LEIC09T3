import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';


StepDefinitionGeneric ThenTheIconIsDifferentStep() {
  return then<FlutterWorld>(
    'a badge on the notifications button is displayed',

    (context) async {

      final finder = await FlutterDriverUtils.isPresent(
        context.world.driver, 
        find.text(String.fromCharCode(0xe450)),
        timeout: const Duration(seconds: 30)
      );

      context.expect(true, finder);
    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}