import '../../entities/entities.dart';

abstract class AuthDatasource {
  Future<User> login(String emailOrEmployeeNumber, String password);
  Future<void> register(User user, String password);
}
