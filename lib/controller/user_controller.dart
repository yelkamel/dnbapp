import 'package:dnbapp/model/user_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:get/get.dart';

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
  }

  void clear() {
    _userModel.value = UserModel();
  }
}
