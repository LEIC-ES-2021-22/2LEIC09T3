import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni/controller/local_storage/app_shared_preferences.dart';
import 'package:uni/model/entities/printing.dart';
import 'package:uni/model/entities/printing_job.dart';

class PrintingMockApi {
  static List<dynamic> data = [];
  static final String sharedPrefsKey = '#esof#mockapi#printing';

  Future<void> _ensureSharedPrefs() async {
    if (data.isEmpty) {
      final shared = await SharedPreferences.getInstance();
      if (!shared.containsKey(sharedPrefsKey)) {
        await shared.setString(sharedPrefsKey, jsonEncode([
          {'state': 'retained', 'createdAt': '2022-06-09 21:52:23', 'printer': 'print\\WP-GERAL-P-A4', 'pages': 21, 'price': 0.23, 'documentName': 'Resumos_ESOF.pdf'},
          {'state': 'cancelled', 'createdAt': '2022-06-06 21:52:23', 'printer': 'print\\WP-GERAL-C-A3', 'pages': 21, 'price': 0.84, 'documentName': 'Resumos_ESOF.pdf'},
          {'state': 'retained', 'createdAt': '2022-06-10 10:56:32', 'printer': 'print\\WP-GERAL-P-A4', 'pages': 5, 'price': 0.12, 'documentName': 'Guiao_Apresentacao_Uni.pdf'},
          {'state': 'retained', 'createdAt': '2022-06-03 12:41:12', 'printer': 'print\\WP-GERAL-P-A3', 'pages': 1, 'price': 0.08, 'documentName': 'Poster_Projeto_UP.png'},
        ]));
      }

      final temp = jsonDecode(shared.getString(sharedPrefsKey));
      data = temp;
    }
  }

  Future<void> _syncSharedPrefs() async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString(sharedPrefsKey, jsonEncode(data));
  }

  Future<String> getPrintingJobs() async {
    await _ensureSharedPrefs();
    return jsonEncode(data);
  }

  Future<String> schedulePrintingJob(Printing printing, Uint8List bytes) async {
    await _ensureSharedPrefs();

    final job = {
      'state': 'retained',
      'createdAt': DateTime.now().toString(),
      'printer': 'print\\WP-GERAL-${printing.color == PrintingColor.color ? 'C' : 'P'}-${printing.pageSize.name.toUpperCase()}',
      'pages': printing.numCopies,
      'price': (Random().nextDouble() * 50 + 10).roundToDouble() / 100,
      'documentName': printing.name
    };

    data.add(job);

    _syncSharedPrefs();
    return jsonEncode([job]);
  }

  Future<bool> deletePrintingJob(PrintingJob job) async {
    await _ensureSharedPrefs();

    final len = data.length;
    data = data.where((element) {
      final other = PrintingJob.fromJson(element);
      return other != job;
    }).toList();

    _syncSharedPrefs();
    return data.length != len;
  }
}