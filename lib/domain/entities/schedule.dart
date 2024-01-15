import 'package:teachersguard/domain/entities/entities.dart';

class Schedule {
  final String id;
  final Place place;
  final String begin;
  final String end;
  final List<int> dayOfWeek;

  Schedule({
    required this.id,
    required this.place,
    required this.begin,
    required this.end,
    required this.dayOfWeek});
}
