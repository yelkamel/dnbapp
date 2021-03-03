import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final String uid;
  Rx<UserModel> user = UserModel().obs;
  String userPicture;
  UserController(this.uid);

  @override
  void onInit() async {
    super.onInit();
    user.bindStream(Database().userStream(uid));
    userPicture = await CloudStorage().getPictureFor(uid);
  }

  void clear() {
    user.value = UserModel();
  }

  Future<List<PostModel>> userSaved(UserModel user) async {
    return await Database().getUserSaved(user.saved);
  }

  void addUserPostSaved(PostModel post) {
    user.value.saved.add(post.id);
    Database().saveUser(user.value);
  }

  void removeUserPostSaved(PostModel post) {
    user.value.saved.removeWhere((pId) => pId == post.id);
    Database().saveUser(user.value);
  }

  void snackRadioStarted() {
    Get.snackbar(
      "Welcome  ${user.value.name} 😁",
      "Radio ID: ${user.value.badgeId}",
      colorText: Theme.of(Get.context).textTheme.bodyText1.color,
      borderColor: Theme.of(Get.context).primaryColor,
      borderWidth: 1,
      backgroundGradient: LinearGradient(
        colors: [
          Theme.of(Get.context).primaryColor,
          Theme.of(Get.context).accentColor,
        ],
      ),
    );
  }
}
