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
    if (state.id.isNotEmpty) return;
    try {
      final auth = await _authUseCase.getLocalAuth();

      if (auth == null) {
        final user = await _authUseCase.login(emailOrEmployeeNumber, password);
        await _authUseCase.saveAuthLocally(user);
        state = user;
      } else {
        state = auth;
      }
    } on AuthException catch (e) {
      throw AuthException(e.message);
    }
  }

  Future<void> getLocalUserAuth() async {
    try {
      final user = await _authUseCase.getLocalAuth();
      state = user!;
    } on AuthException catch (e) {
      throw AuthException(e.message);
    }
  }

  Future<void> removeLocalUserAuth() async {
    try {
      await _authUseCase.removeAuthLocally();
    } on AuthException catch (e) {
      throw AuthException(e.message);
    }
  }
}
