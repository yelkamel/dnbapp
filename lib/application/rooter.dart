import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/controller/auth_controller.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home_screen.dart';
import 'onboarding/login_screen.dart';
import 'onboarding/onboarding_screen.dart';

class Rooter extends StatelessWidget {
  const Rooter({Key key}) : super(key: key);

  Widget buildContent(AuthController authCtrl) {
    if (authCtrl.loading.value) return LoadingAnimated();

    if (authCtrl.user?.uid == null) return LoginScreen();

    if (authCtrl.isSignUp.value) return OnBoardingScreen();

    return Obx(() {
      final userCtrl = Get.find<UserController>();
      print('uuser ${userCtrl.user}');

      if (userCtrl.user.value.status == null ||
          userCtrl.user.value.status == "registration") {
        return OnBoardingScreen();
      }

      return Home();
    });
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
