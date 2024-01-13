import 'package:teachersguard/domain/entities/entities.dart';
import 'package:teachersguard/domain/repositories/repositories.dart';

class ScheduleUseCase {
  final ScheduleRepository _scheduleRepository;

  ScheduleUseCase(this._scheduleRepository);

  Future<List<Schedule>> getScheduleByUserId(String userId) {
    return _scheduleRepository.fetchScheduleByUserId(userId);
  }
}
