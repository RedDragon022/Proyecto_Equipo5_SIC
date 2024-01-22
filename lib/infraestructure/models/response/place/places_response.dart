class PlacesResponse {
    final List<PlaceResponse> places;

    PlacesResponse({
        required this.places,
    });

    factory PlacesResponse.fromJson(Map<String, dynamic> json) => PlacesResponse(
        places: List<PlaceResponse>.from(json["places"].map((x) => PlaceResponse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
    };
}

class PlaceResponse {
    final String id;
    final String name;

    PlaceResponse({
        required this.id,
        required this.name,
    });

    factory PlaceResponse.fromJson(Map<String, dynamic> json) => PlaceResponse(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
