import 'package:teachersguard/domain/repositories/repositories.dart';

import '../../domain/entities/entities.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<User> login(String emailOrEmployeeNumber, String password) {
    return _authRepository.login(emailOrEmployeeNumber, password);
  }

  Future<void> register(User user, String password) {
    return _authRepository.register(user, password);
  }
}
