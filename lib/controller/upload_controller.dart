import 'dart:io';

import 'package:dnbapp/service/cloud_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  UploadTask uploadTask;
  File image;

  RxBool uploading = false.obs;

  void uploadVideoPost(String postId, File file) {
    uploadTask = CloudStorage().uploadVideoWithId(postId, file);
    uploading.value = true;

    uploadTask.whenComplete(() {
      uploadSnackBar("Congrat upload finish", "The video is available !");
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
