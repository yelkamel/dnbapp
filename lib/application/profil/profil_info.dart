import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilInfo extends StatelessWidget {
  const ProfilInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = Get.find<UserController>().user;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(user.name.toString()),
          Text(user.nbpost.toString()),
          Text(user.badge.toString()),
          Text(user.email.toString()),
        ],
      );
    });
  }
}
