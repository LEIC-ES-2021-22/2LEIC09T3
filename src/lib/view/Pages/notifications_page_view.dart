import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/uni_notification.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/slidable_widget.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

class NotificationsPageView extends StatelessWidget {
  final List<UniNotification> notifications;
  final void Function(UniNotification) removeNotification;

  NotificationsPageView({
    Key key,
    @required this.notifications,
    @required this.removeNotification,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          PageTitle(name: 'Notificações'),
        ],
      ),
      Expanded(
          child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          final item = notifications[index];

          return SlidableWidget(
            child: buildListTile(item),
          );
        },
      ))
    ]);
  }

  Widget buildListTile(UniNotification item) => ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      shape: ContinuousRectangleBorder(
          side: BorderSide(
        color: Color.fromARGB(255, 128, 128, 128),
        width: 1.2,
      )),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.date,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 4),
          Text(
            item.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ));
}
