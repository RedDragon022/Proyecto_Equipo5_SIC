import 'package:teachersguard/domain/datasources/remote/auth_datasource.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/repositories/repositories.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl(this._authDatasource);

  @override
  Future<User> login(String emailOrEmployeeNumber, String password) {
    return _authDatasource.login(emailOrEmployeeNumber,password);
  }

  @override
  Future<void> register(User user, String password) {
    return _authDatasource.register(user, password);
  }
}
