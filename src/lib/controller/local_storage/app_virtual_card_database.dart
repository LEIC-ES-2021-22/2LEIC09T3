import 'dart:async';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:uni/model/entities/virtual_card.dart';
import 'package:sqflite/sqflite.dart';

/// Manages the app's Virtual Card database.
///
/// This database stores information about VirtualCards.
class AppVirtualCardDatabase extends AppDatabase {
  AppVirtualCardDatabase()
      : super('virtual_cards.db',
            ['CREATE TABLE virtual_cards(cardId INTEGER PRIMARY KEY, privateKey TEXT)']);

  /// Replaces all of the data in this database with [VirtualCard].
  Future<void> saveNewVirtualCard(VirtualCard virtualCard) async {
    await deleteVirtualCards();
    await _insertVirtualCard(virtualCard);
  }

  /// Adds all items from [virtualCards] to this database.
  ///
  /// If a row with the same data is present, it will be replaced.
  Future<void> _insertVirtualCard(VirtualCard virtualCard) async {
    await insertInDatabase('virtual_cards', virtualCard.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Returns a VirtualCard
  Future<VirtualCard> virtualCard() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    // Query the table for All The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('virtual_cards');

    if (maps.isEmpty) return null;
    return VirtualCard(maps[0]['cardId'], maps[0]['privateKey']);
  }

  /// Deletes all of the data stored in this database.
  Future<void> deleteVirtualCards() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    await db.delete('virtual_cards');
  }
}
