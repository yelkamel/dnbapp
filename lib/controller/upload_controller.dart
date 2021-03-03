import 'dart:io';

import 'package:dnbapp/service/cloud_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  UploadTask uploadTask;
  File image;

  RxBool uploading = false.obs;
  double progress;
  File fileTmpToUpload;

  void uploadVideoPost(String postId, File file) async {
    uploadTask = null;
    debugPrint("===> [Upload Controller] Copy To Tmp file");
    fileTmpToUpload = await CloudStorage().copyFileToTmp(postId, file);
    debugPrint("===> [Upload Controller] Name File  ${fileTmpToUpload.path}");
    uploadTask = CloudStorage().uploadVideoWithId(postId, fileTmpToUpload);
    debugPrint("===> [Upload Controller] uploadTask created");
    uploading.value = true;
    uploadTask.asStream().listen((event) {
      final progressTmp = event.bytesTransferred * 100 / event.totalBytes;
      debugPrint("===> [Upload Controller] $progressTmp %");

      if (progressTmp - progress > 10) {
        uploadSnackBar("Upload Progress", "$progressTmp%");
      }
    });
    uploadTask.whenComplete(() {
      debugPrint("===> [Upload Controller] whenComplete");
      uploadSnackBar("Congrat upload finish", "The video is available !");
      CloudStorage().deleteFile(fileTmpToUpload);
    });
  }

  void uploadSnackBar(String title, String descr) {
    Get.snackbar(
      title,
      descr,
      colorText: Theme.of(Get.context).textTheme.bodyText1.color,
      backgroundGradient: LinearGradient(
        colors: [
          Theme.of(Get.context).primaryColor,
          Theme.of(Get.context).accentColor,
        ],
      ),
    );
  }
}
