import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/model/entities/printing.dart';
import 'package:uni/model/entities/printing_job.dart';
import 'package:uni/model/entities/room_booking.dart';
import 'package:uni/model/entities/profile.dart';
import 'package:uni/model/entities/restaurant.dart';
import 'package:uni/model/entities/session.dart';
import 'package:uni/model/entities/trip.dart';
import 'package:uni/model/entities/university_room.dart';
import 'package:uni/model/entities/virtual_card.dart';
import 'package:uni/model/entities/uni_notification.dart';
import 'package:uni/model/entities/room_booking.dart';
import 'package:uni/model/home_page_model.dart';

import '../model/entities/bus_stop.dart';

class SaveLoginDataAction {
  Session session;
  SaveLoginDataAction(this.session);
}

class SetLoginStatusAction {
  RequestStatus status;
  SetLoginStatusAction(this.status);
}

class SetExamsAction {
  List<Exam> exams;
  SetExamsAction(this.exams);
}

class SetExamsStatusAction {
  RequestStatus status;
  SetExamsStatusAction(this.status);
}

class SetNotificationStatusAction {
  RequestStatus status;
  SetNotificationStatusAction(this.status);
}

class SetBookingStatusAction {
  RequestStatus status;
  SetBookingStatusAction(this.status);
}

class SetRestaurantsAction {
  List<Restaurant> restaurants;
  SetRestaurantsAction(this.restaurants);
}

class SetRestaurantsStatusAction {
  RequestStatus status;
  SetRestaurantsStatusAction(this.status);
}

class SetScheduleAction {
  List<Lecture> lectures;
  SetScheduleAction(this.lectures);
}

class SetScheduleStatusAction {
  RequestStatus status;
  SetScheduleStatusAction(this.status);
}

class SetInitialStoreStateAction {
  SetInitialStoreStateAction();
}

class SaveProfileAction {
  Profile profile;
  SaveProfileAction(this.profile);
}

class SaveProfileStatusAction {
  RequestStatus status;
  SaveProfileStatusAction(this.status);
}

class SaveUcsAction {
  List<CourseUnit> ucs;
  SaveUcsAction(this.ucs);
}

class SetPrintBalanceAction {
  String printBalance;
  SetPrintBalanceAction(this.printBalance);
}

class SetPrintBalanceStatusAction {
  RequestStatus status;
  SetPrintBalanceStatusAction(this.status);
}

class SetFeesBalanceAction {
  String feesBalance;
  SetFeesBalanceAction(this.feesBalance);
}

class SetFeesLimitAction {
  String feesLimit;
  SetFeesLimitAction(this.feesLimit);
}

class SetFeesStatusAction {
  RequestStatus status;
  SetFeesStatusAction(this.status);
}

class SetCoursesStatesAction {
  Map<String, String> coursesStates;
  SetCoursesStatesAction(this.coursesStates);
}

class SetBusTripsAction {
  Map<String, List<Trip>> trips;
  SetBusTripsAction(this.trips);
}

class SetBusStopsAction {
  Map<String, BusStopData> busStops;
  SetBusStopsAction(this.busStops);
}

class SetBusTripsStatusAction {
  RequestStatus status;
  SetBusTripsStatusAction(this.status);
}

class SetBusStopTimeStampAction {
  DateTime timeStamp;
  SetBusStopTimeStampAction(this.timeStamp);
}

class SetCurrentTimeAction {
  DateTime currentTime;
  SetCurrentTimeAction(this.currentTime);
}

class UpdateFavoriteCards {
  List<FAVORITE_WIDGET_TYPE> favoriteCards;
  UpdateFavoriteCards(this.favoriteCards);
}

class SetCoursesStatesStatusAction {
  RequestStatus status;
  SetCoursesStatesStatusAction(this.status);
}

class SetPrintRefreshTimeAction {
  String time;
  SetPrintRefreshTimeAction(this.time);
}

class SetFeesRefreshTimeAction {
  String time;
  SetFeesRefreshTimeAction(this.time);
}

class SetBookingsRefreshTimeAction {
  String time;
  SetBookingsRefreshTimeAction(this.time);
}

class SetHomePageEditingMode {
  bool state;
  SetHomePageEditingMode(this.state);
}

class SetLastUserInfoUpdateTime {
  DateTime currentTime;
  SetLastUserInfoUpdateTime(this.currentTime);
}

class SetExamFilter {
  Map<String, bool> filteredExams;
  SetExamFilter(this.filteredExams);
}

class SetUserFaculties {
  List<String> faculties;
  SetUserFaculties(this.faculties);
}

class SetVirtualCard {
  VirtualCard virtualCard;
  SetVirtualCard(this.virtualCard);
}

class SetVirtualCardStatus {
  RequestStatus status;
  SetVirtualCardStatus(this.status);
}

class SetNotificationsAction {
  List<UniNotification> notifications;
  SetNotificationsAction(this.notifications);
}

class SetBookingsAction {
  List<RoomBooking> bookings;
  SetBookingsAction(this.bookings);
}

class SetUniversityRoomAction {
  UniversityRoom room;
  SetUniversityRoomAction(this.room);
}

class SetUniversityRoomStatusAction {
  RequestStatus status;
  SetUniversityRoomStatusAction(this.status);
}


class SetPrintingsAction {
  List<Printing> printings;
  SetPrintingsAction(this.printings);
}

class SetPrintingJobsAction {
  List<PrintingJob> printingJobs;
  SetPrintingJobsAction(this.printingJobs);
}
