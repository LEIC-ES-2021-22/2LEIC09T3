/// Manages a RoomBooking.
///
/// The information stored is:
/// - The `bookingId`, `accepted` and `room` of the RoomBooking
/// - The RoomBooking's `duration`, `day`, `month`, `year`, `hours` and `minutes`
class RoomBooking {
  int bookingId;
  bool accepted;
  String room;
  int duration;
  DateTime date;

  RoomBooking(this.bookingId, this.accepted, this.room, this.duration, this.date) {}

  /// Converts this RoomBooking to a map.
  Map<String, dynamic> toMap() {
    return {
      'bookingId': bookingId,
      'accepted': accepted,
      'room': room,
      'duration': duration,
      'date': date.toString()
    };
  }

  RoomBooking copyWith(
      {int bookingId, bool accepted, String room, DateTime date}) {
    return RoomBooking(bookingId ?? this.bookingId, accepted ?? this.accepted,
        room ?? this.room, duration ?? this.duration, date ?? this.date);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomBooking &&
          runtimeType == other.runtimeType &&
          bookingId == other.bookingId &&
          accepted == other.accepted &&
          room == other.room &&
          duration == other.duration &&
          date == other.date;

  @override
  int get hashCode =>
      bookingId.hashCode ^ 
      accepted.hashCode ^ 
      room.hashCode ^ 
      duration.hashCode ^ 
      date.hashCode;
}
