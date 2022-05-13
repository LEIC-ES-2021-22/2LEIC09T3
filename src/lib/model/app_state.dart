// enum should be placed somewhere else?
import 'package:uni/model/entities/bus_stop.dart';
import 'package:uni/model/entities/session.dart';
import 'package:uni/model/entities/trip.dart';
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
      'notifications': <UniNotification>[
        UniNotification(
          'O estado do nome MÃE foi alterado',
          'O estado do nome MÃE foi alterado.',
          false,
          '22 fev 2022',
        ),
        UniNotification(
          'O pedido de alteração de Cartão Cidadão foi rejeitado.',
          'Tem de fazer um novo pedido e anexar o documento comprovativo.',
          true,
          '1 abr 2020',
        ),
        UniNotification(
          'Lorem ipsum dolor sit amet',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          true,
          '16 dez 2021',
        )
      ],
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
