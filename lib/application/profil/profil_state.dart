import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:get/get.dart';

class ProfilState extends GetxController {
  final UserModel user;
  ProfilState(this.user);

  RxList<PostModel> posts = <PostModel>[].obs;
  RxBool loading = true.obs;
  RxList<PostModel> savedPosts = <PostModel>[].obs;

  @override
  void onInit() async {
    posts.bindStream(Database().userPostStream(user.id));
    final val = await Get.find<UserController>().userSaved(user);
    savedPosts.assignAll(val);
    loading.value = false;
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
