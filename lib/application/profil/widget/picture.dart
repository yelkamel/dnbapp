import 'package:dnbapp/application/container/dnb_user_picture.dart';
import 'package:dnbapp/application/profil/profil_state.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilPicture extends StatelessWidget {
  final double size;
  const ProfilPicture({Key key, this.size = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Get.find<ProfilState>();

    if (state.currentUser) {
      return Obx(
        () {
          final user = Get.find<UserController>().user;

          return DnbUserPicture(uid: user.id, size: size);
        },
      );
    }

    return DnbUserPicture(uid: state.user.id, size: size);
  }
}
