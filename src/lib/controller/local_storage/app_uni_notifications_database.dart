import 'dart:async';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:uni/model/entities/uni_notification.dart';
import 'package:sqflite/sqflite.dart';

/// Manages the app's Notifications Data database.
///
/// This database stores information about SIGARRA notifications.
class AppNotificationsDatabase extends AppDatabase {
  AppNotificationsDatabase()
      : super('notifications.db', ['CREATE TABLE notifications(sigarraId INTEGER PRIMARY KEY, title TEXT, content TEXT, read INTEGER, date TEXT)']); 

  /// Replaces all of the data in this database with [notifications].
  void saveNewNotifications(List<UniNotification> notifications) async { 
    await deleteNotifications();
    await insertNotifications(notifications);
  }

  /// Adds all items from [notifications] to this database.
  /// 
  /// If a row with the same data is present, nothing is done.
  Future<void> insertNotifications(List<UniNotification> notifications) async {
    for (UniNotification notification in notifications) {
      await insertInDatabase(
        'notifications',
        notification.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
    }
  }

  /// Returns a list containing all of the notifications stored in this database.
  Future<List<UniNotification>> notifications() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    // Query the table for All The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('notifications');
      
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return UniNotification(
          maps[i]['sigarraId'],
          maps[i]['title'],
          maps[i]['content'],
          maps[i]['read'] == 1,
          DateTime.parse(maps[i]['date']));
    });
  }
  /// Deletes all of the data stored in this database.
  Future<void> deleteNotifications() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    await db.delete('notifications');
  }
}
