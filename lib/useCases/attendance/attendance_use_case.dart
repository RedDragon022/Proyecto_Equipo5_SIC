import 'package:teachersguard/domain/entities/entities.dart';
import 'package:teachersguard/domain/repositories/repositories.dart';

class AttendanceUseCase {
  final AttendanceRepository _attendanceRepository;

  AttendanceUseCase(this._attendanceRepository);

  Future<List<Attendance>> getAttendancesByUserId(String userId) {
    return _attendanceRepository.fetchAttendancesByUserId(userId);
  }
}
