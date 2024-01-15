import 'package:teachersguard/domain/entities/entities.dart';
import 'package:teachersguard/infraestructure/models/response/schedule/schedule_response.dart';

class ScheduleMapper {
  static Schedule mapScheduleResponseToScheduleEntity(
          ScheduleObjectResponse response) =>
      Schedule(
          id: response.scheduleId,
          place: Place(id: response.placeId, name: response.placeName),
          begin: response.start,
          end: response.end,
          dayOfWeek: response.dayOfWeek
      );
}
