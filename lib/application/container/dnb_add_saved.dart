import 'package:dnbapp/application/common/image_widget.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DnbAddPostToSaved extends StatelessWidget {
  final PostModel post;
  const DnbAddPostToSaved({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final user = Get.find<UserController>().user.value;
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: user.saved.contains(post.id)
              ? ImageWidget(
                  'assets/icon/check_book.svg',
                )
              : ImageWidget(
                  'assets/icon/add_book.svg',
                ),
        );
      },
    );
  }
}
