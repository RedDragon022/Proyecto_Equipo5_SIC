import '../../entities/entities.dart';

abstract class AttendanceRepository {
  Future<List<Attendance>> fetchAttendancesByUserId(String userId);
  Future<WeekAttendance> fetchWeekAttendanceByUserId(String userId);
}
