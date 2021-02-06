import 'dart:async';

import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:dnbapp/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WorldState extends GetxController {
  RxList<PostModel> posts = <PostModel>[].obs;
  GoogleMapController mapController;
  RxString status = 'close'.obs;
  Rx<PostModel> selectedPost = PostModel().obs;
  bool get isClose => status.value == "close";

  @override
  void onInit() {
    final user = Get.find<UserController>().user;
    posts.bindStream(Database().userPostStream(user.id));
    once(status, (_) {
      selectedPost.value = posts.last;
    });

    super.onInit();
  }

  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    final style = await getMapStyle();
    await mapController.setMapStyle(style);
    update();
  }

  Future<void> goNext() async {
    final index = posts.indexWhere((p) => p.id == selectedPost.value.id);

    if (index < posts.length - 1) {
      selectedPost.value = posts[index + 1];
    } else {
      selectedPost.value = posts[0];
    }
    updateCameraPosition();
  }

  void updateCameraPosition() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: selectedPost.value.latlng, zoom: 4)));
  }

  @override
  void onClose() {
    super.onClose();
  }
}
