class WeekAttendanceResponse {
    final WeekAttendances weekAttendances;

    WeekAttendanceResponse({
        required this.weekAttendances,
    });

    factory WeekAttendanceResponse.fromJson(Map<String, dynamic> json) => WeekAttendanceResponse(
        weekAttendances: WeekAttendances.fromJson(json["weekAttendances"]),
    );

    Map<String, dynamic> toJson() => {
        "weekAttendances": weekAttendances.toJson(),
    };
}

class WeekAttendances {
    final int totalAttendances;
    final int attendances;

    WeekAttendances({
        required this.totalAttendances,
        required this.attendances,
    });

    factory WeekAttendances.fromJson(Map<String, dynamic> json) => WeekAttendances(
        totalAttendances: json["totalAttendances"],
        attendances: json["attendances"],
    );

    Map<String, dynamic> toJson() => {
        "totalAttendances": totalAttendances,
        "attendances": attendances,
    };
}
