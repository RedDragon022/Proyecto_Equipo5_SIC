import 'package:teachersguard/domain/entities/entities.dart';

class Attendance {
  final String id;
  final DateTime entryDate;
  final DateTime exitDate;
  final String userId;
  final Place place;
  final bool isAttendanceCompleted;

  Attendance(
      {required this.id,
      required this.entryDate,
      required this.exitDate,
      required this.userId,
      required this.place,
      required this.isAttendanceCompleted
      });
}
