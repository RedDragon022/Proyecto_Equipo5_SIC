import 'dart:typed_data';

abstract class CameraService {
  Future<String?> takePhoto();
  Future<String?> selectPhoto();
}