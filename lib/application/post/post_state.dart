import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
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
  RxBool hideNext = true.obs;

  final picker = ImagePicker();
  UploadTask uploadTask;
  PostModel post = PostModel(
    createdDate: DateTime.now(),
    views: 0,
    country: CountryCode.fromCode("FR"),
  );

  SwiperController controller = SwiperController();

  List<String> steplist = [
    'intro',
    'type',
    'name',
    'track',
    'location',
    'select',
    'end'
  ];
  List<String> checklistStr = [
    "video Dance on Drum and bass",
    "video taked from landscape",
    "video with good quality",
    "video who show nicely step"
  ];

  RxList<String> checklist = <String>[].obs;
  RxString type = "".obs;

  String get currentStep => steplist[step.value];

  @override
  void onInit() {
    super.onInit();
    // Get.find<RadioController>().pause();
    step.value = 0;
  }

  Future getVideoToUpload() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    if (pickedFile == null) {
      Get.back();
      return;
    }

    file = File(pickedFile.path);
    await controller.next();
    hideNext.value = false;
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

    if (currentStep == 'type') hideNext.value = true;
    // if (currentStep == 'select') hideNext.value = true;
  }

  void goBackStep() async {
    debugPrint("===> [PostStep] ${step.value}");
    if (step.value == 0) {
      Get.back();
      return;
    }

    await controller.previous();
  }

  Future submitPost() async {
    final userCtrl = Get.find<UserController>();
    debugPrint('===> [Upload] start');
    post.createdDate = DateTime.now();
    post.uid = userCtrl.user.id;
    final docRef = await Database().addPost(post);
    debugPrint("===> [Upload] Post ID: ${docRef.id}");
    Get.find<UploadController>().uploadVideoPost(docRef.id, file);

    Get.back();
  }

  void onSelectAgreement(String text, bool value) {
    if (value) checklist.add(text);
    if (!value) checklist.remove(text);
    hideNext.value = checklist.length != checklistStr.length;
  }

  @override
  void onClose() {
    Get.find<RadioController>().play();
    step.value = 0;
    super.onClose();
  }
}
