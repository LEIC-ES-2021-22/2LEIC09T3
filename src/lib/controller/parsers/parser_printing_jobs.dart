import 'package:uni/model/entities/printing_job.dart';

import 'dart:convert';

Future<List<PrintingJob>> parsePrintingJobs(String printingJobsJson) async {
  final jobs = <PrintingJob>[];
  final printingJobs = jsonDecode(printingJobsJson);

  for (dynamic job in printingJobs) {
    final String state = job['state'];
    if (state != 'retained') {
      continue;
    }

    final DateTime createdAt = DateTime.parse(job['createdAt']);
    final String printer = job['printer'];
    final int pages = job['pages'];
    final double price = job['price'];
    final String docName = job['documentName'];

    jobs.add(PrintingJob(createdAt, printer, pages, price, docName));
  }

  return jobs;
}