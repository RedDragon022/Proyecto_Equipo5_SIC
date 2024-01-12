
import '../../infraestructure/services/camera/camera_service.dart';

class CameraUseCase {
  final CameraService _cameraService;

  CameraUseCase(this._cameraService);

  Future<String?> selectPhoto() async {
    return _cameraService.selectPhoto();
  }

  Future<String?> takePhoto() async {
    return _cameraService.takePhoto();
  }
}