class AuthResponse {
    String id;
    String emailOrEmployeeNumber;
    String name;
    String surnames;
    String faceImage;
    bool isAdmin;

    AuthResponse({
        required this.id,
        required this.emailOrEmployeeNumber,
        required this.name,
        required this.surnames,
        required this.faceImage,
        required this.isAdmin,
    });

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        id: json["id"],
        emailOrEmployeeNumber: json["emailOrEmployeeNumber"],
        name: json["name"],
        surnames: json["surnames"],
        faceImage: json["faceImage"],
        isAdmin: json["isAdmin"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "emailOrEmployeeNumber": emailOrEmployeeNumber,
        "name": name,
        "surnames": surnames,
        "faceImage": faceImage,
        "isAdmin": isAdmin,
    };
}
