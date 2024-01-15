class DayHelper {
  static int convertDartDayToBackendDay(int day) {
    switch (day) {
      case 7:
        return 0;
      default:
        return day;
    }
  }
}
