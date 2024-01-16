import 'package:teachersguard/domain/entities/attendance.dart';
import 'package:teachersguard/infraestructure/datasources/remote/client/client.dart';
import 'package:teachersguard/infraestructure/errors/errors.dart';
import 'package:teachersguard/infraestructure/mappers/mappers.dart';
import 'package:teachersguard/infraestructure/models/models.dart';

import '../../../domain/datasources/datasources.dart';

class AttendanceDatasourceImpl extends AttendanceDatasource {
  @override
  Future<List<Attendance>> fetchAttendancesByUserId(String userId) async {
    try {
      final json = await client.get('/Attendance/get-list-attendances',
          queryParameters: {'userId': userId});

      if (json.statusCode != 200) {
        throw AttendanceException(json.statusMessage!);
      }

      final response = AttendanceResponse.fromJson(json.data);

      final attendances = response.attendances;

      return attendances
          .map(AttendanceMapper.mapAttendanceResponseToAttendanceEntity)
          .toList();
          
    } on AttendanceException catch (e) {
      throw AttendanceException(e.message);
    }
  }
}
