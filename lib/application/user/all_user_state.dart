import 'package:dnbapp/model/user_model.dart';
import 'package:dnbapp/service/database.dart';

import 'package:get/get.dart';

class AllUserState extends GetxController {
  RxList<UserModel> allUser = <UserModel>[].obs;
  RxBool loading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    allUser.bindStream(Database().allUserStream());
    ever(allUser, (_) {
      loading.value = false;
    });
  }

  @override
  void onClose() {}
}
