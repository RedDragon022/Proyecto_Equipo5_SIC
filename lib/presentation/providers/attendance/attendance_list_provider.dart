import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/config/dependenciesInjection/container.dart';
import 'package:teachersguard/domain/entities/entities.dart';
import 'package:teachersguard/presentation/providers/providers.dart';

import '../../../infraestructure/errors/errors.dart';
import '../../../useCases/use_cases.dart';

final attendanceListProvider =
    StateNotifierProvider<AttendanceListNotifier, List<Attendance>>((ref) {
  final userId = ref.watch(userProvider).id;
  return AttendanceListNotifier(userId, attendanceUseCase);
});

class AttendanceListNotifier extends StateNotifier<List<Attendance>> {
  final String userId;
  final AttendanceUseCase _attendanceUseCase;
  AttendanceListNotifier(this.userId, this._attendanceUseCase) : super([]);

  Future<void> getAttendancesByUserId() async {
    print(userId);
    try {
      state = await _attendanceUseCase.getAttendancesByUserId(userId);
    } on AttendanceException catch (e) {
      print(e.message);
    }
  }
}
