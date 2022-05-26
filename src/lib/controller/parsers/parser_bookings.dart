import 'dart:convert';

import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:collection';

import 'package:uni/model/entities/room_booking.dart';

Future<List<RoomBooking>> parseBookings(String bookingsJson) async {
  final List<RoomBooking> roomBookings = [];
  final bookings = jsonDecode(bookingsJson);

  for (dynamic booking in bookings) {
    final int bookingId = booking['id'];
    final BookingState state = BookingState.accepted; 
    final String room = booking['room'];
    final int duration = booking['duration'];
    final DateTime date = DateTime.parse(booking['date']);

    roomBookings.add(RoomBooking(bookingId, state, room, duration, date));
  }

  roomBookings.sort((a, b) => (a.date).compareTo(b.date));

  return roomBookings;
}
