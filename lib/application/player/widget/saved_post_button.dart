import 'package:dnbapp/application/common/image_widget.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedPostButton extends StatelessWidget {
  final PostModel post;
  final bool remove;
  final double size;
  const SavedPostButton({
    @required this.post,
    Key key,
    this.remove = false,
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final userCtrl = Get.find<UserController>();
      final user = userCtrl.user.value;

      if (remove) {
        return RawMaterialButton(
          onPressed: () {},
          constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
          padding: EdgeInsets.all(10),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(width: 2, color: Theme.of(context).accentColor),
            ),
            child: ImageWidget(
              "assets/icon/remove_saved.svg",
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        );
      }

      if (user.saved.contains(post.id)) {
        return RawMaterialButton(
          onPressed: () {
            Get.snackbar('Youcef have it', 'check your box');
          },
          constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
          child: ImageWidget(
            "assets/icon/done_saved.svg",
            height: size,
            width: size,
            color: Theme.of(context).iconTheme.color,
          ),
        );
      }

      return RawMaterialButton(
        onPressed: () {
          userCtrl.addUserPostSaved(post);
        },
        constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
        child: ImageWidget(
          "assets/icon/add_saved.svg",
          height: size,
          width: size,
          color: Theme.of(context).iconTheme.color,
        ),
      );
    });
  }
}
