import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:get/get.dart';

class ProfilState extends GetxController {
  RxList<PostModel> posts = <PostModel>[].obs;

  @override
  void onInit() {
    final user = Get.find<UserController>().user;
    posts.bindStream(Database().userPostStream(user.id));
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
