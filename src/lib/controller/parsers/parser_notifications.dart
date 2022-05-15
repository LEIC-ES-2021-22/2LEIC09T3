import 'dart:convert';

import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:collection';

import 'package:uni/model/entities/uni_notification.dart';

Future<List<UniNotification>> parseNotifications(String notifsJson) async {
  final List<UniNotification> notifications = [];
  final notifs = jsonDecode(notifsJson);

  for (dynamic notif in notifs) {
    final int sigarraId = notif['id'];
    final String title = notif['title'];
    final String content = notif['content'];
    final bool read = false;
    final DateTime date = DateTime.parse(notif['date']);

    notifications.add(UniNotification(sigarraId, title, content, read, date));
  }

  notifications.sort((a, b) => (a.date).compareTo(b.date));

  
  return notifications;
}
