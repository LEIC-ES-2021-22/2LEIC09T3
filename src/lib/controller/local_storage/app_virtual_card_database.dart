import 'dart:async';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:uni/model/entities/virtual_card.dart';
import 'package:sqflite/sqflite.dart';

/// Manages the app's Virtual Card database.
///
/// This database stores information about SIGARRA notifications.
class AppNotificationsDatabase extends AppDatabase {
  AppNotificationsDatabase()
      : super('virtual_cards.db',
            ['CREATE TABLE virtual_cards(cardId TEXT, privateKey TEXT)']);

  /// Replaces all of the data in this database with [notifications].
  void saveNewVirtualCard(List<VirtualCard> virtualCards) async {
    await deleteVirtualCards();
    await _insertVirtualCards(virtualCards);
  }

  /// Adds all items from [virtualCards] to this database.
  ///
  /// If a row with the same data is present, it will be replaced.
  Future<void> _insertVirtualCards(List<VirtualCard> virtualCards) async {
    for (VirtualCard virtualCard in virtualCards) {
      await insertInDatabase(
        'virtual_cards',
        virtualCard.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  /// Returns a list containing all of the virtual cards stored in this database
  Future<List<VirtualCard>> virtualCards() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    // Query the table for All The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('virtual_cards');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return VirtualCard(maps[i]['cardId'], maps[i]['privateKey']);
    });
  }

  /// Deletes all of the data stored in this database.
  Future<void> deleteVirtualCards() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    await db.delete('virtual_cards');
  }
}
