import 'dart:io';

import 'package:dnbapp/controller/radio_controller.dart';
import 'package:dnbapp/controller/upload_controller.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PostState extends GetxController {
  File file;
  RxInt step = 0.obs;
  final picker = ImagePicker();
  UploadTask uploadTask;
  PostModel post = PostModel(
    createdDate: DateTime.now(),
    views: 0,
  );

  SwiperController controller = SwiperController();
  List<String> steplist = ['intro', 'type', 'name', 'track', 'select', 'end'];

  String get currentStep => steplist[step.value];

  @override
  void onInit() {
    super.onInit();
    Get.find<RadioController>().pause();
    ever<int>(step, (_) {
      if (currentStep == 'select') {
        getVideoToUpload();
      }
    });
  }

  Future getVideoToUpload() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    if (pickedFile == null) {
      Get.back();
      return;
    }

    file = File(pickedFile.path);
    step.value = steplist.indexWhere((e) => e == 'end');
  }

  void setField(String field, String value) {
    if (field == "name") post.name = value.capitalizeFirst;
    if (field == "producer") post.producer = value.capitalizeFirst;
    if (field == "trackName") post.trackName = value.capitalizeFirst;
  }

  void goNextStep() async {
    if (step.value == steplist.length - 1) {
      submitPost();
      return;
    }
    await controller.next();
    step.value = step.value + 1;
  }

  Future submitPost() async {
    final userCtrl = Get.find<UserController>();
    debugPrint('===> [Upload] start');
    // post.createdDate = DateTime.now();
    // post.uid = userCtrl.user.id;
    // final docRef = await Database().addPost(post);
    // Get.find<UploadController>().uploadVideoPost(docRef.id, file);

    Get.back();
  }

  @override
  void onClose() {
    Get.find<RadioController>().play();
    step.value = 0;
    super.onClose();
  }
}
