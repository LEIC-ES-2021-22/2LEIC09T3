import 'package:flutter/material.dart';
import 'package:uni/model/entities/uni_notification.dart';
import 'package:uni/model/profile_page_model.dart';
import 'package:uni/view/Pages/unnamed_page_view.dart';

/*
class SingleNotificationPageView extends StatelessWidget {
  final UniNotification notification;

  SingleNotificationPageView({
    Key key,
    @required this.notification,
  });
}
*/
class SingleNotificationPageView extends StatefulWidget {
  
  final UniNotification notification;

  SingleNotificationPageView({
    Key key,
    @required this.notification,
  });

  @override
  State<StatefulWidget> createState() => SingleNotificationPageViewState(
  notification: notification);
}

class SingleNotificationPageViewState extends UnnamedPageView {
  // extends UnnamedPageView {
  SingleNotificationPageViewState({Key key, @required this.notification});

  final UniNotification notification;

  @override
  Widget getBody(BuildContext context) {
    return ListView(shrinkWrap: false, children: childrenList(context));
  }


  /// Returns a list with all the children widgets of this page.
  List<Widget> childrenList(BuildContext context) {
    final List<Widget> list = [];
    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    list.add(notificationTitle(context));
    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    list.add(notificationDate(context));
    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    list.add(notificationIntro(context));
    return list;
  }

  @override
  Widget getNotificationsIcon(BuildContext context) {
    return Container();
  }

  Widget notificationTitle(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
        child: Text(
                    notification.title,
                    textScaleFactor: 1.6,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.displayMedium,
            ),
        // child: Row(
        //   children: <Widget>[

        //     Container(
        //       alignment: Alignment.center,
        //       width: 80.0,
        //       child:
        //         Text(
        //           notification.date,
        //           textAlign: TextAlign.center,
        //           style: Theme.of(context).textTheme.headlineSmall,
        //         ),
        //       )
        //   ],
      );
  }

  Widget notificationDate(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 10.0, left: 20.0, right: 20.0),
      child: Text(
          notification.date,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodySmall,
        )
    );
  }

  Widget notificationIntro(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     border: Border(
      //         bottom: BorderSide(color: Theme.of(context).dividerColor))),
      padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Text(
        notification.content,
        style: Theme.of(context).primaryTextTheme.bodyMedium.copyWith(
        color: Colors.black, 
        fontWeight: FontWeight.w400,
      ),
    ));
  }
}
