import 'package:teachersguard/domain/entities/schedule.dart';
import 'package:teachersguard/infraestructure/datasources/remote/client/client.dart';
import 'package:teachersguard/infraestructure/errors/errors.dart';
import 'package:teachersguard/infraestructure/mappers/schedule_mapper.dart';
import 'package:teachersguard/infraestructure/models/models.dart';

import '../../../domain/datasources/datasources.dart';

class ScheduleDatasourceImpl extends ScheduleDatasource {
  @override
  Future<List<Schedule>> fetchScheduleByUserId(String userId) async {
    try {
      final json = await client.get('/Schedule/get-list-schedule',
          queryParameters: {'userId': userId});

      if (json.statusCode != 200) {
        throw ScheduleException(json.statusMessage!);
      }

      final response = ScheduleResponse.fromJson(json.data);

      final schedules = response.schedules;

      return schedules.map(ScheduleMapper.mapScheduleResponseToScheduleEntity).toList();

    } on ScheduleException catch (e) {
      throw ScheduleException(e.message);
    }
  }
}
