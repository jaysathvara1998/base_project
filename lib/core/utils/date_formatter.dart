import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatToReadable(DateTime date) {
    return DateFormat('dd MMM, yyyy').format(date);
  }
}
