// enum should be placed somewhere else?
import 'package:uni/model/entities/bus_stop.dart';
import 'package:uni/model/entities/room_booking.dart';
import 'package:uni/model/entities/session.dart';
import 'package:uni/model/entities/trip.dart';
import 'package:uni/model/entities/virtual_card.dart';
import 'package:uni/utils/constants.dart' as Constants;

import 'entities/exam.dart';
import 'entities/lecture.dart';
import 'entities/restaurant.dart';
import 'entities/uni_notification.dart';

enum RequestStatus { none, busy, failed, successful }

///
class AppState {
  Map content = Map<String, dynamic>();

  Map getInitialContent() {
    return {
      'schedule': <Lecture>[],
      'exams': <Exam>[],
      'restaurants': <Restaurant>[],
      'filteredExam': Map<String, bool>(),
      'scheduleStatus': RequestStatus.none,
      'loginStatus': RequestStatus.none,
      'examsStatus': RequestStatus.none,
      'selected_page': Constants.navPersonalArea,
      'session': Session(authenticated: false),
      'configuredBusStops': Map<String, BusStopData>(),
      'currentBusTrips': Map<String, List<Trip>>(),
      'busstopStatus': RequestStatus.none,
      'timeStamp': DateTime.now(),
      'currentTime': DateTime.now(),
      'profileStatus': RequestStatus.none,
      'printBalanceStatus': RequestStatus.none,
      'feesStatus': RequestStatus.none,
      'coursesStateStatus': RequestStatus.none,
      'lastUserInfoUpdateTime': null,
      'virtualCard': null,
      'virtualCardStatus': RequestStatus.none,
      'notifications': <UniNotification>[],
      'bookings': <RoomBooking>[
          RoomBooking(
            159246, 
            BookingState.accepted, 
            'B002', 
            60,
            DateTime(2021, 12, 16, 15, 10),
          ),
          RoomBooking(
            168321, 
            BookingState.cancelled, 
            'B202', 
            180,
            DateTime(2021, 12, 11, 13, 0),
          ),
          RoomBooking(
            171832,
            BookingState.pending,
            'I003',
            140,
            DateTime(2022, 5, 17, 14, 30),
          ),
          RoomBooking(
            1718232,
            BookingState.pending,
            'I003',
            140,
            DateTime(2022, 5, 17, 14, 30),
          ),
      ]
    };
  }

  AppState(Map content) {
    if (content != null) {
      this.content = content;
    } else {
      this.content = this.getInitialContent();
    }
  }

  AppState cloneAndUpdateValue(key, value) {
    return AppState(Map.from(this.content)..[key] = value);
  }

  AppState getInitialState() {
    return AppState(null);
  }
}
