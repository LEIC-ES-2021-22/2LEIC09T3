/// Manages a UniNotification.
///
/// The information stored is:
/// - The `title`, `content` and `status` of the UniNotification
/// - The UniNotification's `day`, `month` and `year`
class UniNotification {

  static final _months = [
    'jan',
    'fev',
    'mar',
    'abr',
    'mai',
    'jun',
    'jul',
    'ago',
    'set',
    'out',
    'nov',
    'dez'
  ];

  int sigarraId;
  String title;
  String content;
  bool read;
  DateTime date;

  String get readableDate => '${date.day} ${_months[date.month - 1]} ${date.year}';

  UniNotification(this.sigarraId, this.title, this.content,
      this.read, this.date);

  /// Converts this UniNotification to a map.
  Map<String, dynamic> toMap() {
    return {
      'sigarraId': sigarraId,
      'title': title,
      'content': content,
      'read': read ? 1 : 0,
      'date': date.toString(),
    };
  }

  UniNotification copyWith({ int sigarraId, String title, String content, bool read, DateTime date }) {
    return UniNotification(
      sigarraId ?? this.sigarraId,
      title ?? this.title,
      content ?? this.content,
      read ?? this.read,
      date ?? this.date
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniNotification &&
          runtimeType == other.runtimeType &&
          sigarraId == other.sigarraId &&
          title == other.title &&
          content == other.content &&
          date == other.date;

  @override
  int get hashCode =>
      sigarraId.hashCode ^
      title.hashCode ^
      content.hashCode ^
      read.hashCode ^
      date.hashCode;
}
