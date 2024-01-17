import 'package:teachersguard/domain/entities/user.dart';
import 'package:teachersguard/infraestructure/datasources/remote/client/client.dart';
import 'package:teachersguard/infraestructure/errors/errors.dart';
import 'package:teachersguard/infraestructure/mappers/mappers.dart';

import '../../../domain/datasources/datasources.dart';
import '../../models/models.dart';

class AuthDatasourceImpl extends AuthDatasource {
  @override
  Future<User> login(String emailOrEmployeeNumber, String password) async {
    try {
      final json = await client.get(
        '/User/get',
        queryParameters: {
          'EmailOrEmployeeNumber': emailOrEmployeeNumber,
          'Password': password,
        },
      );

      if (json.statusCode != 200) {
        throw AuthException(AutheErrorResponse.fromJson(json.data).message);
      }

      final response = AuthResponse.fromJson(json.data);

      return UserMapper.mapAuthResponseToUserEntity(response);
    } on AuthException catch (e) {
      throw AuthException(e.message);
    }
  }

  @override
  Future<void> register(User user, String password) async {
    try {
      final json = await client.post(
        '/User/create',
        data: {
          "emailOrEmployeeNumber": user.id,
          "password": password,
          "faceImage": user.imageProfile,
          "name": user.name,
          "surnames": user.surnames
        }
      );

      if (json.statusCode != 201) {
        throw AuthException(json.statusMessage!);
      }
    } on AuthException catch (e) {
      throw AuthException(e.message);
    }
  }
}
