import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/config/dependenciesInjection/container.dart';
import 'package:teachersguard/infraestructure/errors/errors.dart';
import 'package:teachersguard/useCases/use_cases.dart';

import '../../../domain/entities/entities.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(authUseCase);
});

class UserNotifier extends StateNotifier<User> {
  final AuthUseCase _authUseCase;

  UserNotifier(this._authUseCase) : super(User());

  Future<void> login(String emailOrEmployeeNumber, String password) async {
    try {
      state = await _authUseCase.login(emailOrEmployeeNumber, password);
    } on AuthException catch (e) {
      throw AuthException(e.message);
    }
  }
}
