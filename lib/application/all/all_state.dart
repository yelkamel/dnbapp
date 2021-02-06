import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/database.dart';

import 'package:get/get.dart';

class AllState extends GetxController {
  RxList<PostModel> allPosts = <PostModel>[].obs;
  RxList<bool> opens = [false, false, false].obs;

  RxList<PostModel> postsToShow = <PostModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    allPosts.bindStream(Database().postStream());

    ever(allPosts, (_) {
      postsToShow = allPosts;
    });
  }

  void randomize() {
    postsToShow.shuffle();
    opens.assignAll([false, false, false]);
  }

  @override
  void onClose() {}
}
