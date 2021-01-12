import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilPicture extends StatelessWidget {
  const ProfilPicture({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = Get.find<UserController>().user;

      return Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 4, color: Theme.of(context).accentColor),
        ),
        child: user.pp != null
            ? ClipOval(
                child: Image.network(user.pp),
              )
            : Container(),
      );
    });
  }
}
