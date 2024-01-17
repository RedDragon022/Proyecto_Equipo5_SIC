class User {
  final String id;
  final String name;
  final String surnames;
  final String imageProfile;
  final bool isAdmin;

  User(
      {this.id = '',
      this.name = '',
      this.surnames = '',
      this.imageProfile = '',
      this.isAdmin = false});
  
   factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      surnames: json['surnames'] ?? '',
      imageProfile: json['imageProfile'] ?? '',
      isAdmin: json['isAdmin'] ?? false,
    );
  }

  static Map<String, dynamic> toJson(User user) {
    return {
      'id': user.id,
      'name': user.name,
      'surnames': user.surnames,
      'imageProfile': user.imageProfile,
      'isAdmin': user.isAdmin,
    };
  }
}
