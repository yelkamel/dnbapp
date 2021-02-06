import 'package:dnbapp/application/login/login_screen.dart';
import 'package:dnbapp/application/login/onboarding_screen.dart';
import 'package:dnbapp/controller/auth_controller.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home_screen.dart';

class Rooter extends StatelessWidget {
  const Rooter({Key key}) : super(key: key);

  Widget buildContent(AuthController authCtrl) {
    if (authCtrl.user?.uid == null) return LoginScreen();
    if (authCtrl.isSignUp.value) return OnBoardingScreen();
    Get.put<UserController>(UserController(authCtrl.user?.uid));
    return Home();
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
      builder: (_) {
        final authCtrl = Get.find<AuthController>();
        return AnimatedSwitcher(
          duration: 500.milliseconds,
          child: buildContent(authCtrl),
        );
      },
    );
  }
}
