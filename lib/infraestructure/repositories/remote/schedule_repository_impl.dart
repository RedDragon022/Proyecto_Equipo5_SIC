import 'package:teachersguard/domain/entities/schedule.dart';

import '../../../domain/datasources/datasources.dart';
import '../../../domain/repositories/repositories.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  final ScheduleDatasource _scheduleDatasource;

  ScheduleRepositoryImpl(this._scheduleDatasource);
  @override
  Future<List<Schedule>> fetchScheduleByUserId(String userId) {
    return _scheduleDatasource.fetchScheduleByUserId(userId);
  }
}
