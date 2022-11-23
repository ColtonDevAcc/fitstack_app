import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadImage(String path, String fileName, File image) async {
    try {
      final ref = _firebaseStorage.ref().child(path).child(fileName);
      await ref.putFile(image);
      return ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e);
      return '';
    }
  }
}
