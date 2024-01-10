import 'package:teachersguard/infraestructure/datasources/datasources.dart';
import 'package:teachersguard/useCases/use_cases.dart';
import '../../infraestructure/repositories/repositories.dart';

final authDataSource = AuthDatasourceImpl();

final authRepository = AuthRepositoryImpl(authDataSource);

final authUseCase = AuthUseCase(authRepository);
