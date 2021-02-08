import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/database.dart';

import 'package:get/get.dart';

class PostController extends GetxController {
  RxList<PostModel> allPosts = <PostModel>[].obs;
  RxBool loading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    allPosts.bindStream(Database().postStream());

    ever(allPosts, (_) {
      loading.value = false;
    });
  }

  @override
  void onClose() {}
}
