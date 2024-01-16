import 'package:image_picker/image_picker.dart';
import 'package:teachersguard/infraestructure/services/camera/camera_service.dart';

class CameraServiceImpl extends CameraService {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<String?> selectPhoto() async {
    final XFile? photo = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);

    if (photo == null) return null;

    return photo.path;
  }

  @override
  Future<String?> takePhoto() async {
    final XFile? photo = await _imagePicker.pickImage(
        preferredCameraDevice: CameraDevice.front,
        source: ImageSource.camera,
        imageQuality: 100);

    if (photo == null) return null;

    return photo.path;
  }
}
