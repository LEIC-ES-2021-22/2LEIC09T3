import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uni/model/entities/uni_notification.dart';
import 'package:uni/model/single_notification_page_model.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/slidable_widget.dart';

class NotificationsPageView extends StatelessWidget {
  final List<UniNotification> notifications;
  final void Function(BuildContext, int) removeNotification;
  final void Function(BuildContext, int) changeNotificationState;

  NotificationsPageView({
    Key key,
    @required this.notifications,
    @required this.removeNotification,
    @required this.changeNotificationState,
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
          child: notifications.isEmpty ? 
            Text(
              'Não há notificações para mostrar.',
              style: Theme.of(context).textTheme.bodyMedium,
              )
            : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final item = notifications[index];

                return SlidableWidget(
                  child: Card(
                    elevation: 3,
                    child: buildListTile(context, item)
                  ),
                  onDelete: (context) => removeNotification(context, index),
                  changeState: changeNotifState(context, index),
                );
              },
            )
        )
    ]);
  }

  SlidableAction changeNotifState(BuildContext context, int index) {
    return SlidableAction(
      onPressed: (context) => changeNotificationState(context, index),
      //(context) => changeNotificationState(context, index),
      backgroundColor: Color.fromARGB(255, 215, 215, 215),
      label: 'Marcar como${notifications[index].read ? ' não' : ''} lida',
    );
  }

  Widget buildListTile(BuildContext context, UniNotification item) => ListTile(
    leading: Icon(Icons.clear_all),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      onTap: () {
            if (!item.read) {
              changeNotificationState(
                context,
                notifications.indexWhere((element) => element == item),
              );
            }

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (__) =>
                        SingleNotificationPage(notification: item)));
          },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.readableDate,
            style: item.read
                ? Theme.of(context).textTheme.bodyText2
                : Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 4),
          Text(
            item.title,
            style: item.read
                ? Theme.of(context).textTheme.bodyText2
                : Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ));
}
