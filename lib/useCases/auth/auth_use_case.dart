import 'dart:convert';

import 'package:teachersguard/domain/repositories/repositories.dart';
import 'package:teachersguard/infraestructure/services/localStorage/local_storage_service.dart';

import '../../domain/entities/entities.dart';
import '../../infraestructure/errors/errors.dart';

class AuthUseCase {
  final AuthRepository _authRepository;
  final LocalStorageService _localStorageService;

  AuthUseCase(this._authRepository, this._localStorageService);

  Future<User> login(String emailOrEmployeeNumber, String password) {
    return _authRepository.login(emailOrEmployeeNumber, password);
  }

  Future<void> register(User user, String password) {
    return _authRepository.register(user, password);
  }

  Future<User?> getLocalAuth() async {
    final auth = await _localStorageService.getValue<String>('auth');
    if (auth == null) return null;

    try {
      final authMap = jsonDecode(auth);
      return User.fromJson(authMap);
    } catch (e) {
      throw AuthException("It can't get auth locally");
    }
  }

  Future<void> saveAuthLocally(User user) async {
    await _localStorageService.setKeyValue<String>(
        'auth', jsonEncode(User.toJson(user)));
  }

  Future<void> removeAuthLocally() async {
    await _localStorageService.removeKey('auth');
  }
}
