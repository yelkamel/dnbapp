import 'package:dnbapp/model/user_model.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:dnbapp/service/database.dart';
import 'package:get/get.dart';

import 'radio_controller.dart';

class UserController extends GetxController {
  final String uid;
  Rx<UserModel> _userModel = UserModel().obs;
  UserController(this.uid);

  bool radioStarted = false;

  UserModel get user => _userModel.value;
  set user(UserModel value) => this._userModel.value = value;

  @override
  void onInit() {
    super.onInit();
    _userModel.bindStream(Database().userStream(uid));

    ever<UserModel>(_userModel, (_) {
      if (_.badge?.id != null && !radioStarted) {
        Get.find<RadioController>().start();
        radioStarted = true;
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
}
