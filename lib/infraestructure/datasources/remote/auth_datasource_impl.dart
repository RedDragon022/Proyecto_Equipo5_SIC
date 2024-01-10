import 'package:dio/dio.dart';

import 'package:teachersguard/domain/entities/user.dart';
import 'package:teachersguard/infraestructure/errors/errors.dart';
import 'package:teachersguard/infraestructure/mappers/mappers.dart';

import '../../../domain/datasources/datasources.dart';
import '../../models/response/auth/models.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final client = Dio(BaseOptions(
    baseUrl: 'https://teachersguard.azurewebsites.net/api',
    validateStatus: (status) {
      return status! <
          500; // Devuelve true si el código de estado es menor que 500
    },
  ));

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
  Future<String> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
