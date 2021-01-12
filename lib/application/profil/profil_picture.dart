import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilPicture extends StatelessWidget {
  final double size;
  const ProfilPicture({Key key, this.size = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = Get.find<UserController>().user;

      return Hero(
          tag: "pp",
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(width: 4, color: Theme.of(context).accentColor),
            ),
            child: user.pp != null
                ? ClipOval(
                    child: Image.network(user.pp),
                  )
                : Container(),
          ));
    });
  }
}
