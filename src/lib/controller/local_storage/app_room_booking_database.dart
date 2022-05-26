import 'dart:async';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:uni/model/entities/room_booking.dart';
import 'package:sqflite/sqflite.dart';

/// Manages the app's Room Bookings Data database.
///
/// This database stores information about Room Bookings.
class AppBookingsDatabase extends AppDatabase {
  AppBookingsDatabase()
      : super('room_bookings.db', ['CREATE TABLE room_bookings(bookingId INTEGER PRIMARY KEY, state TEXT, room TEXT, duration INTEGER, date TEXT)']); 

  /// Replaces all of the data in this database with [room_bookings].
  void saveNewBookings(List<RoomBooking> bookings) async { 
    await deleteRoomBookings();
    await insertRoomBookings(bookings);
  }

  /// Adds all items from [bookings] to this database.
  /// 
  /// If a row with the same data is present, it will be replaced.

  Future<void> insertRoomBookings(List<RoomBooking> bookings) async {
    for (RoomBooking booking in bookings) {
      await insertInDatabase(
        'room_bookings',
        booking.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
    }
  }

  /// Returns a list containing all of the room bookings stored in this database.
  Future<List<RoomBooking>> bookings() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    // Query the table for All The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('room_bookings');
      
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return RoomBooking(
          maps[i]['bookingId'],
          BookingState.values.firstWhere((element) => element.name == maps[i]['state']),
          maps[i]['room'],
          maps[i]['duration'],
          DateTime.parse(maps[i]['date']));
    });
  }
  /// Deletes all of the data stored in this database.
  Future<void> deleteRoomBookings() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    await db.delete('room_bookings');
  }
}
