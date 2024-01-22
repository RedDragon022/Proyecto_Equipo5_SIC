import 'package:teachersguard/infraestructure/datasources/datasources.dart';
import 'package:teachersguard/infraestructure/services/services.dart';
import 'package:teachersguard/useCases/place/place_use_case.dart';
import 'package:teachersguard/useCases/use_cases.dart';
import '../../infraestructure/repositories/repositories.dart';

final authDataSource = AuthDatasourceImpl();
final scheduleDatasource = ScheduleDatasourceImpl();
final attendanceDatasource = AttendanceDatasourceImpl();
final placeDatasource = PlaceDatasourceImpl();

final authRepository = AuthRepositoryImpl(authDataSource);
final scheduleRepository = ScheduleRepositoryImpl(scheduleDatasource);
final attendanceRepository = AttendanceRepositoryImpl(attendanceDatasource);
final placeRepository = PlaceRepositoryImpl(placeDatasource);

final cameraService = CameraServiceImpl();
final localStorageService = LocalStorageServiceImpl();

final authUseCase = AuthUseCase(authRepository, localStorageService);
final cameraUseCase = CameraUseCase(cameraService);
final scheduleUseCase = ScheduleUseCase(scheduleRepository);
final attendanceUseCase = AttendanceUseCase(attendanceRepository);
final placeUseCase = PlaceUseCase(placeRepository);
