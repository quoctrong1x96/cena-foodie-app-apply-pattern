import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime? {
  String toStringFormatVN() => this == null
      ? "__/__/____"
      : DateFormat('yyyy-MM-dd – kk:mm').format(this!);
}
