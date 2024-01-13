import 'package:teachersguard/domain/entities/entities.dart';

class Attendance {
  final String id;
  final DateTime entryDate;
  final DateTime exitDate;
  final String userId;
  final Place place;

  Attendance({
    required this.id,
    required this.entryDate,
    required this.exitDate,
    required this.userId,
    required this.place});
}
