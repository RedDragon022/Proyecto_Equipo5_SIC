import '../../entities/entities.dart';

abstract class AuthRepository {
  Future<User> login(String emailOrEmployeeNumber, String password);
  Future<String> register(User user);
}
