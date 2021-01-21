import 'dart:io';

import 'package:dnbapp/controller/radio_controller.dart';
import 'package:dnbapp/controller/upload_controller.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

enum PostStep {
  select,
  input,
  upload,
}

class PostState extends GetxController {
  File file;
  Rx<PostStep> step = PostStep.select.obs;
  final picker = ImagePicker();
  UploadTask uploadTask;
  PostModel post = PostModel(
    createdDate: DateTime.now(),
    views: 0,
  );

  @override
  void onInit() {
    super.onInit();
    Get.find<RadioController>().pause();
    getVideoToUpload();
  }

  Future getVideoToUpload() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    if (pickedFile == null) {
      Get.back();
      return;
    }

    file = File(pickedFile.path);
    step.value = PostStep.input;
  }

  void setField(String field, String value) {
    if (field == "name") post.name = value.capitalizeFirst;
    if (field == "producer") post.producer = value.capitalizeFirst;
    if (field == "trackName") post.trackName = value.capitalizeFirst;
  }

  Future submitPost() async {
    final userCtrl = Get.find<UserController>();

    post.createdDate = DateTime.now();
    post.uid = userCtrl.user.id;
    final docRef = await Database().addPost(post);
    Get.find<UploadController>().uploadVideoPost(docRef.id, file);

    Get.back();
  }

  @override
  void onClose() {
    Get.find<RadioController>().play();
    super.onClose();
  }
}
