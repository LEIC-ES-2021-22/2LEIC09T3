import 'package:uni/model/entities/printing.dart';

class PrintingJob {
  final DateTime date;
  final String printerName;
  final int numPages;
  final double price;
  final String documentName;

  PrintingJob(this.date, this.printerName, this.numPages, this.price,
      this.documentName);

  static PrintingJob fromJson(dynamic data) {
    return PrintingJob(
      DateTime.parse(data['date']),
      data['printerName'],
      data['numPages'],
      data['price'],
      data['documentName'],
    );
  }

  PageSize getPageSize() {
    return this.printerName.substring(this.printerName.lastIndexOf('-') + 1) ==
            "A4"
        ? PageSize.a4
        : PageSize.a3;
  }

  PrintingColor isColored() {
    return this.printerName.substring(this.printerName.lastIndexOf('-') - 1,
                this.printerName.lastIndexOf('-')) ==
            'C'
        ? PrintingColor.color
        : PrintingColor.baw;
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date.toString(),
      'printerName': printerName,
      'numPages': numPages,
      'price': price,
      'documentName': documentName
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrintingJob &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          printerName == other.printerName &&
          numPages == other.numPages &&
          price == other.price &&
          documentName == other.documentName;

  @override
  int get hashCode =>
      date.hashCode ^
      printerName.hashCode ^
      numPages.hashCode ^
      price.hashCode ^
      documentName.hashCode;
}
