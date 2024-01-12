import 'package:teachersguard/infraestructure/datasources/datasources.dart';
import 'package:teachersguard/infraestructure/services/camera/camera_service_impl.dart';
import 'package:teachersguard/useCases/use_cases.dart';
import '../../infraestructure/repositories/repositories.dart';

final authDataSource = AuthDatasourceImpl();

final authRepository = AuthRepositoryImpl(authDataSource);

final cameraService = CameraServiceImpl();

final authUseCase = AuthUseCase(authRepository);
final cameraUseCase = CameraUseCase(cameraService);
