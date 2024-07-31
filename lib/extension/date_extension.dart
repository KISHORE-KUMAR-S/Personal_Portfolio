import 'package:intl/intl.dart' show DateFormat;

extension DateExtension on DateTime {
  String toMonthAndYear() {
    final DateFormat monthFormat = DateFormat('MMMM');
    final DateFormat yearFormat = DateFormat.y();

    return "${monthFormat.format(this).toUpperCase()} ${yearFormat.format(this)}";
  }
}
