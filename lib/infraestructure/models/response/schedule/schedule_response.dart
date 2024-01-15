class ScheduleResponse {
  final List<ScheduleObjectResponse> schedules;

  ScheduleResponse({
    required this.schedules,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      ScheduleResponse(
        schedules: List<ScheduleObjectResponse>.from(
            json["schedules"].map((x) => ScheduleObjectResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "schedules": List<dynamic>.from(schedules.map((x) => x.toJson())),
      };
}

class ScheduleObjectResponse {
  final String placeId;
  final String placeName;
  final String scheduleId;
  final String userId;
  final String start;
  final String end;
  final List<int> dayOfWeek;

  ScheduleObjectResponse({
    required this.placeId,
    required this.placeName,
    required this.scheduleId,
    required this.userId,
    required this.start,
    required this.end,
    required this.dayOfWeek,
  });

  factory ScheduleObjectResponse.fromJson(Map<String, dynamic> json) =>
      ScheduleObjectResponse(
        placeId: json["placeId"],
        placeName: json["placeName"],
        scheduleId: json["scheduleId"],
        userId: json["userId"],
        start: json["start"],
        end: json["end"],
        dayOfWeek: List<int>.from(json["dayOfWeek"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "placeId": placeId,
        "placeName": placeName,
        "scheduleId": scheduleId,
        "userId": userId,
        "start": start,
        "end": end,
        "dayOfWeek": List<dynamic>.from(dayOfWeek.map((x) => x)),
      };
}
