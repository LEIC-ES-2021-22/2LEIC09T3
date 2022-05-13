import 'package:flutter/material.dart';
import 'package:uni/model/entities/uni_notification.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Pages/single_notification_page_view.dart';

class SingleNotificationPage extends StatefulWidget {
  final UniNotification notification;

  const SingleNotificationPage({
    Key key,
    @required this.notification,
  });

  @override
  _SingleNotificationPageState createState() => _SingleNotificationPageState();
}

// class _SingleNotificationPageState extends SecondaryPageViewState {
class _SingleNotificationPageState extends State<SingleNotificationPage> {
  _SingleNotificationPageState({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleNotificationPageView(
      notification: (widget as SingleNotificationPage).notification,
    );
  }
}