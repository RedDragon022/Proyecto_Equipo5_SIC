import 'package:teachersguard/domain/entities/entities.dart';

abstract class ScheduleRepository{
  Future<List<Schedule>> fetchScheduleByUserId(String userId);
}