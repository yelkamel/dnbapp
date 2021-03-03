import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:get/get.dart';

class BoxState extends GetxController {
  final UserModel user;
  RxBool loading = true.obs;
  RxList<PostModel> boxPosts = <PostModel>[].obs;
  RxString badgeId = "".obs;

  BoxState(this.user);
  @override
  void onInit() async {
    final userCtrl = Get.find<UserController>();
    final postSaved = await userCtrl.userSaved(userCtrl.user.value);
    badgeId.value = postSaved[0].badgeId;
    boxPosts.assignAll(postSaved);

    loading.value = false;

    super.onInit();
  }

  @override
  void onClose() {}
}
