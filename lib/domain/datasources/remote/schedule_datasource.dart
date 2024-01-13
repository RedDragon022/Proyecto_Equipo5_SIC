import 'package:teachersguard/domain/entities/entities.dart';

abstract class ScheduleDatasource{
  Future<List<Schedule>> fetchScheduleByUserId(String userId);
}