import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilInfo extends StatelessWidget {
  const ProfilInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = Get.find<UserController>().user;

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user.value.name.capitalizeFirst.toString(),
              style: Theme.of(context).textTheme.subtitle1),
        ],
      );
    });
  }
}
