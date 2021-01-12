import 'package:dnbapp/application/login/login_screen.dart';
import 'package:dnbapp/controller/auth_controller.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home_screen.dart';

class Rooter extends StatelessWidget {
  const Rooter({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
      builder: (_) {
        final authCtrl = Get.find<AuthController>();
        if (authCtrl.user?.uid != null) {
          Get.put<UserController>(UserController(authCtrl.user?.uid));
          return Home();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
