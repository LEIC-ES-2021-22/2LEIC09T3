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
  String status;

  String day;
  String month;
  String year;

  /// might be used (?)
  // DateTime date;

  UniNotification(String this.title, String this.content, String this.status, 
                  String this.day, String this.month, String this.year) {
    // final monthKey = months[this.month] (?) ;
    // this.date = DateTime.parse(year + '-' + monthKey + '-' + day) (?) ;
  }

  /// Converts this UniNotification to a map.
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'status': status,
      'day': day,
      'month': month,
      'year': year
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniNotification &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          content == other.content &&
          status == other.status &&
          day == other.day &&
          month == other.month &&
          year == other.year;

  @override
  int get hashCode =>
      title.hashCode ^
      content.hashCode ^
      status.hashCode ^
      day.hashCode ^
      month.hashCode ^
      year.hashCode;
}
