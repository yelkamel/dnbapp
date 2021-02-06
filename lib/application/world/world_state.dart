import 'dart:async';

import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Map<String, CameraPosition> tabs = {
  "FR": CameraPosition(target: LatLng(50.0874654, 14.4212535), zoom: 4),
  "PT": CameraPosition(target: LatLng(40.0332629, -7.8896263), zoom: 4),
  "DE": CameraPosition(target: LatLng(52.5001698, 5.7480821), zoom: 4)
};

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

  Future setMapStyle() async {
    final String style = await DefaultAssetBundle.of(Get.context)
        .loadString('assets/map/warriorz.json');
    print('===> [Wordl] set map style');
    await mapController.setMapStyle(style);
  }

  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await setMapStyle();
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
    mapController.animateCamera(
        CameraUpdate.newCameraPosition(tabs[selectedPost.value.country.code]));
  }

  @override
  void onClose() {
    super.onClose();
  }
}
