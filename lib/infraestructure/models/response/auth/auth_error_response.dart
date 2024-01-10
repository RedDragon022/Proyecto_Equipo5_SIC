class AutheErrorResponse {
    String message;

    AutheErrorResponse({
        required this.message,
    });

    factory AutheErrorResponse.fromJson(Map<String, dynamic> json) => AutheErrorResponse(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
