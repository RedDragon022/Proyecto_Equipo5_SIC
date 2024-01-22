// To parse this JSON data, do
//
//     final weekUsePlaceResponse = weekUsePlaceResponseFromJson(jsonString);

import 'dart:convert';

WeekUsePlaceResponse weekUsePlaceResponseFromJson(String str) => WeekUsePlaceResponse.fromJson(json.decode(str));

String weekUsePlaceResponseToJson(WeekUsePlaceResponse data) => json.encode(data.toJson());

class WeekUsePlaceResponse {
    final UsePlace usePlace;

    WeekUsePlaceResponse({
        required this.usePlace,
    });

    factory WeekUsePlaceResponse.fromJson(Map<String, dynamic> json) => WeekUsePlaceResponse(
        usePlace: UsePlace.fromJson(json["usePlace"]),
    );

    Map<String, dynamic> toJson() => {
        "usePlace": usePlace.toJson(),
    };
}

class UsePlace {
    final String placeId;
    final int totalAttendances;
    final int attendances;

    UsePlace({
        required this.placeId,
        required this.totalAttendances,
        required this.attendances,
    });

    factory UsePlace.fromJson(Map<String, dynamic> json) => UsePlace(
        placeId: json["placeId"],
        totalAttendances: json["totalAttendances"],
        attendances: json["attendances"],
    );

    Map<String, dynamic> toJson() => {
        "placeId": placeId,
        "totalAttendances": totalAttendances,
        "attendances": attendances,
    };
}
