import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric WhenTheUserSwipesToTheRight() {
  return when<FlutterWorld>('the user swipes to the right', (context) async {
    await context.world.driver.scroll(find.byValueKey('block-map'), -300, 0,
        const Duration(milliseconds: 400),
        timeout: const Duration(seconds: 10));
  },
      configuration: StepDefinitionConfiguration()
        ..timeout = const Duration(days: 1));
}
