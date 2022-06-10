import 'dart:async';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:uni/model/entities/printing_job.dart';
import 'package:sqflite/sqflite.dart';

/// Manages the app's Printing Data database.
///
/// This database stores information about Printing Requests that will possibly be sent to print.up.pt via the API.
class AppPrintingJobDatabase extends AppDatabase {
  AppPrintingJobDatabase()
      : super('printingjobs.db', [
          'CREATE TABLE printingjobs(date TEXT, printerName TEXT, numPages INTEGER, price REAL, documentName TEXT, UNIQUE (date, printerName, numPages, price, documentName))'
        ]);

  /// Replaces all of the data in this database with [printingJobs].
  void saveNewPrintingJobs(List<PrintingJob> printingJobs) async {
    await deletePrintingJobs();
    await insertPrintingJobs(printingJobs);
  }

  /// Adds all items from [printingJobs] to this database.
  ///
  /// If a row with the same data is present, nothing is done.
  Future<void> insertPrintingJobs(List<PrintingJob> printingJobs) async {
    for (PrintingJob printingJob in printingJobs) {
      await insertInDatabase(
        'printingjobs',
        printingJob.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
    }
  }

  /// Returns a list containing all of the printing jobs stored in this database.
  Future<List<PrintingJob>> printingJobs() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    // Query the table for All The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('printingjobs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return PrintingJob(
        DateTime.parse(maps[i]['date']),
        maps[i]['printerName'],
        maps[i]['numPages'],
        maps[i]['price'],
        maps[i]['documentName'],
      );
    });
  }

  /// Deletes all of the data stored in this database.
  Future<void> deletePrintingJobs() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    await db.delete('printingjobs');
  }
}
