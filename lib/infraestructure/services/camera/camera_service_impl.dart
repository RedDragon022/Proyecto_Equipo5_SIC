import 'dart:convert';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:teachersguard/infraestructure/services/camera/camera_service.dart';

class CameraServiceImpl extends CameraService {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<String?> selectPhoto() async {
    final XFile? photo = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);

    if (photo == null) return null;

    // Lee la imagen como bytes
    List<int> imageBytes = await photo.readAsBytes();

    // Convierte los bytes a base64
    return base64Encode(Uint8List.fromList(imageBytes));
  }

  @override
  Future<String?> takePhoto() async {
    final XFile? photo = await _imagePicker.pickImage(
        preferredCameraDevice: CameraDevice.front,
        source: ImageSource.camera,
        imageQuality: 100);

    if (photo == null) return null;

    // Lee la imagen como bytes
    List<int> imageBytes = await photo.readAsBytes();

    // Convierte los bytes a base64
    return base64Encode(Uint8List.fromList(imageBytes));
  }
}
