import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/config/dependenciesInjection/container.dart';
import 'package:teachersguard/domain/entities/entities.dart';

import '../../../infraestructure/errors/errors.dart';
import '../../../useCases/use_cases.dart';

final attendanceListProvider =
    StateNotifierProvider<AttendanceListNotifier, List<Attendance>>((ref) {
  return AttendanceListNotifier(authUseCase, attendanceUseCase);
});

class AttendanceListNotifier extends StateNotifier<List<Attendance>> {
  final AuthUseCase _authUseCase;
  final AttendanceUseCase _attendanceUseCase;
  AttendanceListNotifier(this._authUseCase, this._attendanceUseCase)
      : super([]);

  Future<void> getAttendancesByUserId() async {
    
    try {
      final user = await _authUseCase.getLocalAuth();
      state = await _attendanceUseCase.getAttendancesByUserId(user!.id);
    } on AttendanceException catch (e) {
      throw AttendanceException(e.message);
    }
  }
}
