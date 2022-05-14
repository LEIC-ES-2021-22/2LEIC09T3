/// Manages a RoomBooking.
///
/// The information stored is:
/// - The `bookingId`, `accepted` and `room` of the RoomBooking
/// - The RoomBooking's `day`, `month`, `year`, `hours` and `minutes`
class RoomBooking {
  int bookingId;
  bool accepted;
  String room;
  DateTime date;

  RoomBooking(this.bookingId, this.accepted, this.room, this.date) {}

  /// Converts this RoomBOoking to a map.
  Map<String, dynamic> toMap() {
    return {
      'bookingId': bookingId,
      'accepted': accepted,
      'room': room,
      'date': date.toString()
    };
  }

  RoomBooking copyWith({ int bookingId, bool accepted, String room, DateTime date }) {
    return RoomBooking(
      bookingId ?? this.bookingId,
      accepted ?? this.accepted,
      room ?? this.room,
      date ?? this.date
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomBooking &&
          runtimeType == other.runtimeType &&
          bookingId == other.bookingId &&
          accepted == other.accepted &&
          room == other.room &&
          date == other.date;

  @override
  int get hashCode =>
      bookingId.hashCode ^
      accepted.hashCode ^
      room.hashCode ^
      date.hashCode;
}
