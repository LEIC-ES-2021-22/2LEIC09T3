import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'dart:io';
import 'dart:convert';

import 'steps/then_notif_screen_is_shown.dart';
import 'steps/then_the_icon_changes.dart';
import 'steps/when_the_user_taps_notification_button.dart';
import 'steps/when_there_are_unread_notifications.dart';
import 'steps/given_user_is_logged_in.dart';

Future<void> main() {

  print('Please provide your UP username: ', );
  final username = stdin.readLineSync(encoding: utf8);

  print('Please provide your UP password: ');
  final password = stdin.readLineSync(encoding: utf8);

  print('Thanks >:D');
  print('\n');

  final config = FlutterTestConfiguration()
    ..features = [Glob(r'test_driver/features/**.feature')]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ]
    ..stepDefinitions = [GivenUserIsLoggedInStep(username, password), 
                         GivenUserHasUnreadNotifications(), 
                         ThenTheIconIsDifferentStep(),
                         WhenUserTapsNotifButton(),
                         ThenNotifScreenIsShown()]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = 'test_driver/app.dart';
  return GherkinRunner().execute(config);
}