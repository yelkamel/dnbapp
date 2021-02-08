import 'dart:async';

import 'package:dnbapp/application/player/player_screen.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:dnbapp/utils.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WorldState extends GetxController {
  RxList<PostModel> posts = <PostModel>[].obs;
  GoogleMapController mapController;
  Rx<PostModel> selectedPost = PostModel().obs;

  @override
  void onInit() {
    final user = Get.find<UserController>().user;
    posts.bindStream(Database().userPostStream(user.id));
    super.onInit();
  }

  @override
  void onReady() {
    Get.snackbar("Hello", "Find some Dnb video in the world !");
    super.onReady();
  }

  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    final style = await getMapStyle();
    await mapController.setMapStyle(style);
    update();
  }

  void onFindPost(PostModel p) {
    PlayerScreen.show(p);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
