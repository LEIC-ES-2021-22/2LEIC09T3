import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/uni_notification.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/view/Pages/notifications_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends SecondaryPageViewState {
  void removeNotification(BuildContext context, int index) {
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(deleteNotification(index));
  }

  void readOrUnreadNotification(BuildContext context, int index) {
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(toggleNotificationReadStatus(index));
  }

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<UniNotification>>(
        converter: (store) => store.state.content['notifications'],
        builder: (context, notifications) {
          return NotificationsPageView(
            notifications: notifications,
            removeNotification: removeNotification,
            changeNotificationState: readOrUnreadNotification,
          );
        });
  }
}
