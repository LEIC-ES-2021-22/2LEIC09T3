/// Manages a UniNotification.
///
/// The information stored is:
/// - The `title`, `content` and `status` of the UniNotification
/// - The UniNotification's `day`, `month` and `year`
class UniNotification {
  int sigarraId;
  String title;
  String content;
  bool read;

  DateTime date;


  UniNotification(int this.sigarraId, String this.title, String this.content,
      int read, String date) {
    this.read = (read == 1);
    this.date = DateTime.parse(date);
  }

  /// Converts this UniNotification to a map.
  Map<String, dynamic> toMap() {
    return {
      'sigarraId': sigarraId,
      'title': title,
      'content': content,
      'read': read ? 1 : 0,
      'date': date.year.toString() +
          '-' +
          (date.month < 10 ? '0' : '') +
          date.month.toString() +
          '-' +
          (date.day < 10 ? '0' : '') +
          date.day.toString()
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniNotification &&
          runtimeType == other.runtimeType &&
          sigarraId == other.sigarraId &&
          title == other.title &&
          content == other.content &&
          read == other.read &&
          date == other.date;

  @override
  int get hashCode =>
      sigarraId.hashCode ^
      title.hashCode ^
      content.hashCode ^
      read.hashCode ^
      date.hashCode;
}
