import 'package:dnbapp/controller/post_controller.dart';
import 'package:dnbapp/model/post_model.dart';

import 'package:get/get.dart';

class RandomPostState extends GetxController {
  RxList<PostModel> allPosts = <PostModel>[].obs;
  RxBool loading = true.obs;
  RxList<PostModel> postsToShow = <PostModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    postsToShow = Get.find<PostController>().allPosts;
    loading.value = false;
  }

  void randomize() {
    postsToShow.shuffle();
  }

  @override
  void onClose() {}
}
