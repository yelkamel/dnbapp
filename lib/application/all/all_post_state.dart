import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/database.dart';

import 'package:get/get.dart';

class AllPostState extends GetxController {
  RxList<PostModel> allPosts = <PostModel>[].obs;
  RxBool loading = true.obs;
  RxList<PostModel> postsToShow = <PostModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    allPosts.bindStream(Database().postStream());

    ever(allPosts, (_) {
      postsToShow = allPosts;
      loading.value = false;
    });
  }

  void randomize() {
    postsToShow.shuffle();
  }

  @override
  void onClose() {}
}
