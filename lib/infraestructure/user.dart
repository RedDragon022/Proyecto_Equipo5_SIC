class User {
  final String id;
  final String name;
  final String surnames;
  final String imageProfile;
  final bool isAdmin;

  User(
      {required this.id,
      required this.name,
      required this.surnames,
      required this.imageProfile,
      required this.isAdmin
    });
}
