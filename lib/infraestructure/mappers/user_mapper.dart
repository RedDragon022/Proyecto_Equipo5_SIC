import 'package:teachersguard/infraestructure/models/models.dart';

import '../../domain/entities/user.dart';

class UserMapper {
  static User mapAuthResponseToUserEntity(AuthResponse response) => User(
    id: response.id,
    name: response.name,
    surnames: response.surnames,
    imageProfile: response.faceImage,
    isAdmin: response.isAdmin,
  );
}
