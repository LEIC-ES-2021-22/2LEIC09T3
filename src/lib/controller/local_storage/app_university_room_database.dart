import 'dart:async';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:uni/model/entities/university_room.dart';
import 'package:sqflite/sqflite.dart';

/// Manages the app's Virtual Card database.
///
/// This database stores information about UniversityRooms.
class AppUniversityRoomsDatabase extends AppDatabase {
  AppUniversityRoomsDatabase()
      : super('university_rooms.db', [
          'CREATE TABLE university_rooms(roomId INTEGER, name TEXT, path TEXT)'
        ]);

  /// Replaces all of the data in this database with [UniversityRooms].
  void saveNewNotification(List<UniversityRoom> universityRooms) async {
    await deleteUniversityRooms();
    await _insertUniversityRooms(universityRooms);
  }

  /// Adds all items from [UniversityRooms] to this database.
  ///
  /// If a row with the same data is present, it will be replaced.
  Future<void> _insertUniversityRooms(List<UniversityRoom> universityRooms) async {
    for (UniversityRoom universityRoom in universityRooms) {
      await insertInDatabase(
        'university_rooms',
        universityRoom.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  /// Returns a UniversityRoom
  Future<List<UniversityRoom>> universityRooms() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    // Query the table for All The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('university_rooms');
      
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return UniversityRoom(
          maps[i]['roomId'],
          maps[i]['name'],
          maps[i]['path']
        );
    });
  }

  /// Deletes all of the data stored in this database.
  Future<void> deleteUniversityRooms() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    await db.delete('university_rooms');
  }
}
