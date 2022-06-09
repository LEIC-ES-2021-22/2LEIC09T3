import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'dart:io';
import 'dart:convert';

import 'steps/no_unread_notifications.dart';
import 'steps/notification_is_deleted.dart';
import 'steps/notification_swipe.dart';
import 'steps/taps_on_unread_notification.dart';
import 'steps/there_are_notifications.dart';
import 'steps/on_notification_screen.dart';
import 'steps/then_notif_screen_is_shown.dart';
import 'steps/then_the_icon_changes.dart';
import 'steps/when_the_user_taps_notification_button.dart';
import 'steps/given_there_are_unread_notifications.dart';
import 'steps/given_user_is_logged_in.dart';
import 'steps/when_the_student_taps_room_name.dart';
import 'steps/then_a_screen_for_classroom_location_is_shown.dart';

Future<void> main() {
  print(
    'Please provide your UP username: ',
  );
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
    ..stepDefinitions = [
      GivenUserIsLoggedInStep(username, password),
      GivenUserHasUnreadNotifications(),
      ThenTheIconIsDifferentStep(),
      WhenUserTapsNotifButton(),
      ThenNotifScreenIsShown(),
      UserIsOnNotificationsScreen(),
      ThereAreNotifications(),
      SwipeAndTapNotification(),
      TheNotificationIsDeleted(),
      TapsOnUnread(),
      NoUnreadNotifications(),
      WhenUserTapsRoomName(),
      ThenTheClassroomsLocationIsShown()
    ]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = 'test_driver/app.dart';
  return GherkinRunner().execute(config);
}
