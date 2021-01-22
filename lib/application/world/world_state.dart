import 'dart:async';

import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const CameraPosition _kLake =
    CameraPosition(target: LatLng(50.0874654, 14.4212535), zoom: 4);

class WorldState extends GetxController {
  RxList<PostModel> posts = <PostModel>[].obs;
  GoogleMapController mapController;

  @override
  void onInit() {
    final user = Get.find<UserController>().user;
    posts.bindStream(Database().userPostStream(user.id));
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

  Future<void> goToTheLake() async {
    mapController.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  void onClose() {
    super.onClose();
  }
}
