 import 'package:dio/dio.dart';

final client = Dio(BaseOptions(
    baseUrl: 'https://teachersguard.azurewebsites.net/api',
    validateStatus: (status) {
      return status! <
          500; // Devuelve true si el código de estado es menor que 500
    },
  ));