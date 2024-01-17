import 'package:teachersguard/infraestructure/datasources/datasources.dart';
import 'package:teachersguard/infraestructure/repositories/remote/attendance_repository_impl.dart';
import 'package:teachersguard/infraestructure/services/services.dart';
import 'package:teachersguard/useCases/use_cases.dart';
import '../../infraestructure/repositories/repositories.dart';

final authDataSource = AuthDatasourceImpl();
final scheduleDatasource = ScheduleDatasourceImpl();
final attendanceDatasource = AttendanceDatasourceImpl();

final authRepository = AuthRepositoryImpl(authDataSource);
final scheduleRepository = ScheduleRepositoryImpl(scheduleDatasource);
final attendanceRepository = AttendanceRepositoryImpl(attendanceDatasource);

final cameraService = CameraServiceImpl();
final localStorageService = LocalStorageServiceImpl();

final authUseCase = AuthUseCase(authRepository, localStorageService);
final cameraUseCase = CameraUseCase(cameraService);
final scheduleUseCase = ScheduleUseCase(scheduleRepository);
final attendanceUseCase = AttendanceUseCase(attendanceRepository);
