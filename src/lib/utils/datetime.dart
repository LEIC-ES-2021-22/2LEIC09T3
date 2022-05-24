import 'package:intl/intl.dart';

extension TimeUtils on DateTime {
  String get readableTime {
    String hours = DateFormat('HH').format(this);
    String minutes = DateFormat('mm').format(this);
    return hours + 'H' + minutes;
  }
}
