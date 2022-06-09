import 'package:intl/intl.dart';

extension TimeUtils on DateTime {

  static final _months = [
    'jan',
    'fev',
    'mar',
    'abr',
    'mai',
    'jun',
    'jul',
    'ago',
    'set',
    'out',
    'nov',
    'dez'
  ];
  
  String get readableTime {
    String hours = DateFormat('HH').format(this);
    String minutes = DateFormat('mm').format(this);
    return hours + 'H' + minutes;
  }

  String get readableDate => '${this.day} ${_months[this.month - 1]} ${this.year}';
}
