import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloudStorage {
  final service = FirebaseStorage.instance;

  Future<String> getPostVideoById(String id) async {
    try {
      Reference ref = service.ref().child('postvideo/$id');
      debugPrint("===> [ClouseStorage] ref $ref");
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      Get.snackbar("Oups", "error getting CStorage url");
      return null;
    }
  }

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

  UploadTask uploadVideoWithId(String id, File file) {
    try {
      debugPrint("===> [Upload] upload video to postvideo/$id");
      file.rename(id);
      Reference ref = service.ref().child('postvideo/$id');
      return ref.putFile(file);
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

  Future<String> getPictureFor(String uid) async {
    try {
      print("===> [Cloud Storage] get picture profilpicture/$uid");
      Reference ref = service.ref().child('profilpicture/$uid');
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      Get.snackbar("Oups", "error getting Picture CloudStorage url");
      return null;
    }
  }
}
