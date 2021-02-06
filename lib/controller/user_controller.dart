import 'package:dnbapp/model/user_model.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'radio_controller.dart';

class UserController extends GetxController {
  final String uid;
  Rx<UserModel> _userModel = UserModel().obs;
  UserController(this.uid);

  UserModel get user => _userModel.value;
  set user(UserModel value) => this._userModel.value = value;

  @override
  void onInit() {
    super.onInit();
    _userModel.bindStream(Database().userStream(uid));

    once<UserModel>(_userModel, (_) {
      if (_.badgeId != null) {
        Get.find<RadioController>().start();
      }
    });
  }

  void clear() {
    _userModel.value = UserModel();
  }

  Future<void> updateProfilPicture() async {
    final urlPP = await CloudStorage().getPictureFor(user.id);
    await Database().updateUser(user.id, {"pp": urlPP});
    _userModel.update((_) => _.pp = urlPP);
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
