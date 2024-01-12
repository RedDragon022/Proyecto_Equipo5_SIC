import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'storage_service.dart';

class FirebaseStorageServiceImpl extends StorageService {
  final storage = FirebaseStorage.instance;

  @override
  Future<String> uploadImage(String imagePath, String userId) async {
    String storagePath = 'posts/$userId/';
    final filename = imagePath.split('/').last;
    final ref = storage.ref().child('$storagePath$filename');

    await ref.putFile(File(imagePath));
    final imageUrl = await ref.getDownloadURL();

    return imageUrl;
  }
}
