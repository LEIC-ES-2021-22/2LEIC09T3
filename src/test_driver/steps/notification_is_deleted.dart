import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric TheNotificationIsDeleted() {
  return then<FlutterWorld>(
    'the notification is deleted from uni',
    (context) async {
      final no_notifications = await FlutterDriverUtils.isPresent(
        context.world.driver, 
        find.text('Não há notificações para mostrar.'),
        timeout: const Duration(seconds: 30)
      );

      context.expect(no_notifications, true);
    }, configuration: StepDefinitionConfiguration()..timeout = const Duration(days: 1)
  );
}