import 'package:intl/intl.dart';

enum BookingState {
  accepted,
  pending,
  cancelled
}
/// Manages a RoomBooking.
///
/// The information stored is:
/// - The `bookingId`, `state` and `room` of the RoomBooking
/// - The RoomBooking's `duration`, `day`, `month`, `year`, `hours` and `minutes`
class RoomBooking {
  int bookingId;
  BookingState state;
  String room;
  int duration;
  DateTime date;

  RoomBooking(this.bookingId, this.state, this.room, this.duration, this.date) {}

  /// Converts this RoomBooking to a map.
  Map<String, dynamic> toMap() {
    return {
      'bookingId': bookingId,
      'state': state,
      'room': room,
      'duration': duration,
      'date': date
    };
  }

  RoomBooking copyWith(
      {int bookingId, BookingState state, String room, DateTime date}) {
    return RoomBooking(bookingId ?? this.bookingId, state ?? this.state,
        room ?? this.room, duration ?? this.duration, date ?? this.date);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomBooking &&
          runtimeType == other.runtimeType &&
          bookingId == other.bookingId &&
          state == other.state &&
          room == other.room &&
          duration == other.duration &&
          date == other.date;

  @override
  int get hashCode =>
      bookingId.hashCode ^ 
      state.hashCode ^ 
      room.hashCode ^ 
      duration.hashCode ^ 
      date.hashCode;
}
