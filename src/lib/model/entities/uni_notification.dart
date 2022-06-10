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
          sigarraId == other.sigarraId;

  @override
  int get hashCode => sigarraId.hashCode;
}
