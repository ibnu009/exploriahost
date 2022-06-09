import 'package:intl/intl.dart';

extension IntegerConverter on int {
  String toRupiah() {
    final formatCurrency = NumberFormat.currency(locale: "id-ID");
    String formattedCurrency = "Rp " + formatCurrency.format(this).substring(3);

    return formattedCurrency.substring(0, formattedCurrency.indexOf(','));
  }

  String convertMilliSecondsToDate() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(this);
    final DateFormat formatter = DateFormat('MMM dd, yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }

  String getDueDateFromMilli() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(this);
    DateTime dateNow = DateTime.now();

    Duration diff = date.difference(dateNow);

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
}