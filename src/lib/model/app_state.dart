// enum should be placed somewhere else?
import 'package:uni/model/entities/bus_stop.dart';
import 'package:uni/model/entities/printing.dart';
import 'package:uni/model/entities/printing_job.dart';
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
      'virtualCardStatus': RequestStatus.busy,
      'notifications': <UniNotification>[],
      'bookings': <RoomBooking>[],
      'bookingsStatus' : RequestStatus.none,
      'printings': <Printing>[],
      'printingJobs': <PrintingJob>[],
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
