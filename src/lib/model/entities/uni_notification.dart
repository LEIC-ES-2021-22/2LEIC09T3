var months = {
  'Janeiro': '01',
  'Fevereiro': '02',
  'Março': '03',
  'Abril': '04',
  'Maio': '05',
  'Junho': '06',
  'Julho': '07',
  'Agosto': '08',
  'Setembro': '09',
  'Outubro': '10',
  'Novembro': '11',
  'Dezembro': '12'
};

/// Manages a UniNotification.
///
/// The information stored is:
/// - The `title`, `content` and `status` of the UniNotification
/// - The UniNotification's `day`, `month` and `year`
class UniNotification {
  String title;
  String content;
  bool read;

  String date;

  /// might be used (?)
  // DateTime date;

  UniNotification(String this.title, String this.content, bool this.read,
      String this.date) {
    // final monthKey = months[this.month] (?) ;
    // this.date = DateTime.parse(year + '-' + monthKey + '-' + day) (?) ;
  }

  /// Converts this UniNotification to a map.
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'read': read,
      'date': date,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniNotification &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          content == other.content &&
          read == other.read &&
          date == other.date;

  @override
  int get hashCode =>
      title.hashCode ^ content.hashCode ^ read.hashCode ^ date.hashCode;
}
