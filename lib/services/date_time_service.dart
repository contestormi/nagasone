import 'package:intl/intl.dart';

class DateTimeService {
  static String formatDate(String dateTime) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');

    return formatter.format(DateTime.parse(dateTime));
  }

  static String formatTime(String dateTime) {
    final DateFormat formatter = DateFormat('H:mm');

    return formatter.format(DateTime.parse(dateTime));
  }
}
