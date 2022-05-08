import 'dart:async';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:uni/model/entities/uni_notification.dart';
import 'package:sqflite/sqflite.dart';

/// Manages the app's Notifications Data database.
/// f
/// This database stores information about SIGARRA notifications.
class AppNotificationsDatabase extends AppDatabase {
  AppNotificationsDatabase()
      : super('notifications.db', ['CREATE TABLE notifications(title TEXT, content TEXT, status TEXT, day TEXT, month TEXT, year TEXT)']); 

  /// Replaces all of the data in this database with [notifications].
  void saveNewNotifications(List<UniNotification> notifications) async { 
    await deleteNotifications();
    await _insertNotifications(notifications);
  }

  /// Adds all items from [notifications] to this database.
  /// 
  /// If a row with the same data is present, it will be replaced.

  Future<void> _insertNotifications(List<UniNotification> notifications) async {
    for (UniNotification notification in notifications) {
      await insertInDatabase(
        'notifications',
        notification.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
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
          maps[i]['title'],
          maps[i]['content'],
          maps[i]['status'],
          maps[i]['day'],
          maps[i]['month'],
          maps[i]['year']);
    });
  }
  /// Deletes all of the data stored in this database.
  Future<void> deleteNotifications() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    await db.delete('notifications');
  }
}
