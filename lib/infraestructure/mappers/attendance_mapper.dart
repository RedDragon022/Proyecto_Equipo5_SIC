import 'package:teachersguard/domain/entities/entities.dart';
import 'package:teachersguard/infraestructure/models/models.dart';

class AttendanceMapper {
  static Attendance mapAttendanceResponseToAttendanceEntity(
          AttendanceObject response) =>
      Attendance(
          id: response.attendanceId,
          entryDate: response.entryDate,
          exitDate: response.exitDate,
          userId: response.userId,
          isAttendanceCompleted: response.fullAttendance,
          place: Place(id: response.placeId, name: response.placeName));

  static WeekAttendance mapWeekAttendanceResponseToWeekAttendanceEntity(
          WeekAttendances response) =>
      WeekAttendance(
          totalAttendances: response.totalAttendances,
          attendances: response.attendances);
}
