import 'package:intl/intl.dart';

class DateHelper {
  static String convertTo12HourFormatBackend(String time24Hour) {
    // Parse la cadena de tiempo a un objeto DateTime
    DateTime parsedTime = DateTime.parse('2024-01-01 $time24Hour:00');

    // Formatee la hora en el formato de 12 horas
    String formattedTime = DateFormat.jm().format(parsedTime);

    return formattedTime;
  }

  static String convertTo12HourFormat(DateTime time24hour){
   return DateFormat('hh:mm a').format(time24hour.toLocal());
  }

  static String convertDateTimeToDateTimeOnly(DateTime dateTime){
    return DateFormat('dd/MM/yyyy').format(dateTime);

  }
}
