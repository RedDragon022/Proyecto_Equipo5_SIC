import '../../entities/entities.dart';

abstract class AttendanceDatasource {
  Future<List<Attendance>> fetchAttendancesByUserId(String userId);
  Future<WeekAttendance> fetchWeekAttendanceByUserId(String userId);
}
