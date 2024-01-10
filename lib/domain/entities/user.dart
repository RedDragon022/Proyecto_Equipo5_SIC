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
}
