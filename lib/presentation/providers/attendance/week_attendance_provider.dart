import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/config/dependenciesInjection/container.dart';

import '../../../domain/entities/entities.dart';
import '../../../infraestructure/errors/errors.dart';
import '../../../useCases/use_cases.dart';

final weekAttendanceProvider =
    StateNotifierProvider<WeekAttendanceNotifier, WeekAttendance>((ref) {
  return WeekAttendanceNotifier(authUseCase, attendanceUseCase);
});

class WeekAttendanceNotifier extends StateNotifier<WeekAttendance> {
  final AuthUseCase _authUseCase;
  final AttendanceUseCase _attendanceUseCase;
  WeekAttendanceNotifier(this._authUseCase, this._attendanceUseCase)
      : super(WeekAttendance());

  bool isLoading = true;

  Future<void> getWeekAttendanceByUserId() async {
  
    try {
      final user = await _authUseCase.getLocalAuth();
      state = await _attendanceUseCase.getWeekAttendanceByUserId(user!.id);
      isLoading = false;
    } on AttendanceException catch (e) {
      isLoading = false;
      throw AttendanceException(e.message);
    }

    
  }
}
