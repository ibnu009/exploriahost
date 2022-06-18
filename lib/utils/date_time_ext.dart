import 'package:intl/intl.dart';

extension DateTimeConverter on DateTime {

  String getDueDateFromDateTime() {
    DateTime dateNow = DateTime.now();
    Duration diff = difference(dateNow);

    int day = diff.inDays;
    int hour = diff.inHours;
    int mins = diff.inMinutes;

    if (day <= 0 ){
      return '$hour jam lagi';
    }

    if (hour <= 0){
      return '$mins Menit lagi';
    }

    return '$day hari lagi';
  }

  String convertToExploriaDateAndHour() {
    final DateFormat formatter = DateFormat('MMM dd, yyyy HH:mm');
    final String formatted = formatter.format(this);
    return formatted;
  }

  String convertToHourAndMinute() {
    final DateFormat formatter = DateFormat('HH:mm');
    final String formatted = formatter.format(this);
    return formatted;
  }
}