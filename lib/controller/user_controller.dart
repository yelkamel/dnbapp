import 'package:dnbapp/model/user_model.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'radio_controller.dart';

class UserController extends GetxController {
  final String uid;
  Rx<UserModel> _userModel = UserModel().obs;
  String userPicture;
  UserController(this.uid);

  UserModel get user => _userModel.value;
  set user(UserModel value) => this._userModel.value = value;

  @override
  void onInit() async {
    super.onInit();
    _userModel.bindStream(Database().userStream(uid));
    userPicture = await CloudStorage().getPictureFor(uid);
    once<UserModel>(_userModel, (_) {
      if (_.badgeId != null) {
        Get.find<RadioController>().start();
      }
    });
  }

  void clear() {
    _userModel.value = UserModel();
  }


  void snackRadioStarted() {
    Get.snackbar(
      "Welcome  ${user.name} 😁",
      "Radio ID: ${user.badgeId}",
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
