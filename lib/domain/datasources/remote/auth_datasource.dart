import '../../entities/entities.dart';

abstract class AuthDatasource {
  Future<User> login(String emailOrEmployeeNumber, String password);
  Future<String> register(User user);
}
