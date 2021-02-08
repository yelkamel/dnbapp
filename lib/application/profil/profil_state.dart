import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:get/get.dart';

class ProfilState extends GetxController {
  final UserModel user;
  final bool currentUser;

  RxList<PostModel> posts = <PostModel>[].obs;

  ProfilState(this.user, {this.currentUser = false});

  @override
  void onInit() {
    posts.bindStream(Database().userPostStream(user.id));
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
