import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/config/dependenciesInjection/container.dart';
import 'package:teachersguard/infraestructure/errors/errors.dart';
import 'package:teachersguard/useCases/use_cases.dart';

import '../../../domain/entities/entities.dart';

final scheduleProvider =
    StateNotifierProvider<ScheduleNotifier, List<Schedule>>((ref) {
  return ScheduleNotifier(scheduleUseCase, authUseCase);
});

class ScheduleNotifier extends StateNotifier<List<Schedule>> {
  final AuthUseCase _authUseCase;
  final ScheduleUseCase _scheduleUseCase;
  ScheduleNotifier(this._scheduleUseCase, this._authUseCase) : super([]);

  Future<void> getScheduleByUserId() async {
    if (state.isNotEmpty) return;
    try {
      final user = await _authUseCase.getLocalAuth();
      state = await _scheduleUseCase.getScheduleByUserId(user!.id);
    } on ScheduleException catch (e) {
      throw ScheduleException(e.message);
    }
  }
}
