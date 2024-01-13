import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/config/dependenciesInjection/container.dart';
import 'package:teachersguard/infraestructure/errors/errors.dart';
import 'package:teachersguard/useCases/use_cases.dart';

import '../../../domain/entities/entities.dart';

final scheduleProvider =
    StateNotifierProvider<ScheduleNotifier, List<Schedule>>((ref) {
  return ScheduleNotifier(scheduleUseCase);
});

class ScheduleNotifier extends StateNotifier<List<Schedule>> {
  final ScheduleUseCase _scheduleUseCase;
  ScheduleNotifier(this._scheduleUseCase) : super([]);

  Future<void> getScheduleByUserId(String userId) async {
    print(userId);
    try {
      state = await _scheduleUseCase.getScheduleByUserId(userId);
    } on ScheduleException catch (e) {
      print(e.message);
    }
  }
}
