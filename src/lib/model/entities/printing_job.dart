class PrintingJob {
  final int id;
  final DateTime date;
  final String printerName;
  final int numPages;
  final double price;
  final String documentName;
  final String status;

  PrintingJob(this.id, this.date, this.printerName, this.numPages, this.price,
      this.documentName, this.status) {}

  static PrintingJob fromJson(dynamic data) {
    return PrintingJob(
        data['id'],
        DateTime.parse(data['date']),
        data['printerName'],
        data['numPages'],
        data['price'],
        data['documentName'],
        data['status']);
  }

  String getPageSize() {
    return this.printerName.substring(this.printerName.lastIndexOf('-') + 1);
  }

  bool isColored() {
    return this.printerName.substring(this.printerName.lastIndexOf('-') - 1,
            this.printerName.lastIndexOf('-')) ==
        'C';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toString(),
      'printerName': printerName,
      'numPages': numPages,
      'price': price,
      'documentName': documentName,
      'status': status
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrintingJob &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
