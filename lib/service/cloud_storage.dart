import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloudStorage {
  final service = FirebaseStorage.instance;

  Future<String> getRadioFor(String radioId) async {
    try {
      Reference ref = service.ref().child('radio/$radioId.mp3');
      debugPrint("===> [ClouseStorage] ref $ref");
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      Get.snackbar("Oups", "error getting CStorage url");
      return null;
    }
  }

  UploadTask uploadPictureFor(String uid, File file) {
    try {
      Reference ref = service.ref().child('profilpicture/$uid');
      return ref.putFile(file);
    } catch (e) {
      Get.snackbar("Oups", "error getting CStorage url");
      return null;
    }
  }
}
