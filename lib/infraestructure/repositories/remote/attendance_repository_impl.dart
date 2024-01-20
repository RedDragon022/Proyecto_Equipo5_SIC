import 'package:teachersguard/domain/datasources/remote/attendance_datasource.dart';
import 'package:teachersguard/domain/entities/attendance.dart';
import 'package:teachersguard/domain/entities/week_attendance.dart';
import 'package:teachersguard/domain/repositories/remote/attendance_repository.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
  final AttendanceDatasource _attendanceDatasource;

  AttendanceRepositoryImpl(this._attendanceDatasource);

  @override
  Future<List<Attendance>> fetchAttendancesByUserId(String userId) {
    return _attendanceDatasource.fetchAttendancesByUserId(userId);
  }

  @override
  Future<WeekAttendance> fetchWeekAttendanceByUserId(String userId) {
    return _attendanceDatasource.fetchWeekAttendanceByUserId(userId);
  }
}
