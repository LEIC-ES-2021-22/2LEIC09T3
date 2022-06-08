import 'dart:async';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:uni/model/entities/printing.dart';
import 'package:sqflite/sqflite.dart';

/// Manages the app's Printing Data database.
///
/// This database stores information about printings.
class AppPrintingDatabase extends AppDatabase {
  AppPrintingDatabase()
      : super('printings.db', [
          'CREATE TABLE printings(id INTEGER PRIMARY KEY, name TEXT, path TEXT, pageSize TEXT, color INTEGER, numCopies INTEGER, price REAL)'
        ]);

  /// Replaces all of the data in this database with [printings].
  void saveNewPrintings(List<Printing> printings) async {
    await deletePrintings();
    await insertPrintings(printings);
  }

  /// Adds all items from [printings] to this database.
  ///
  /// If a row with the same data is present, nothing is done.
  Future<void> insertPrintings(List<Printing> printings) async {
    for (Printing printing in printings) {
      await insertInDatabase(
        'printings',
        printing.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
    }
  }

  /// Returns a list containing all of the printings stored in this database.
  Future<List<Printing>> printings() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    // Query the table for All The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('printings');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Printing(
          maps[i]['id'],
          maps[i]['name'],
          maps[i]['path'],
          maps[i]['pageSize'],
          maps[i]['color'] == 1,
          maps[i]['numCopies'],
          maps[i]['price']);
    });
  }

  /// Deletes all of the data stored in this database.
  Future<void> deletePrintings() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    await db.delete('printings');
  }
}
