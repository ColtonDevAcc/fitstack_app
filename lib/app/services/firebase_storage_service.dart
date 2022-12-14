import 'dart:io';

import 'package:FitStack/app/services/analytics_service.dart';
import 'package:FitStack/main.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadImage(String path, String fileName, File image) async {
    try {
      final ref = _firebaseStorage.ref().child(path).child(fileName);
      await ref.putFile(image);
      return ref.getDownloadURL();
    } on FirebaseException catch (e) {
      locator<AnalyticsService>().logError(exception: e.toString(), reason: 'error uploading image');
      return '';
    }
  }
}
