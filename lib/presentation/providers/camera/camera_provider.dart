import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/dependenciesInjection/container.dart';
import '../../../useCases/use_cases.dart';

final cameraProvider = StateNotifierProvider<CameraNotifier, String?>((ref) {
  return CameraNotifier(cameraUseCase);
});

class CameraNotifier extends StateNotifier<String?> {
  final CameraUseCase _cameraUseCase;
  CameraNotifier(this._cameraUseCase) : super(null);

  Future<void> selectPhoto() async {
    state = await _cameraUseCase.selectPhoto();
  }

  Future<void> takePhoto() async {
    state = await _cameraUseCase.takePhoto();
  }

  
}