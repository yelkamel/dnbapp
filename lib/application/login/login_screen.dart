import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/controller/auth_controller.dart';
import 'package:evolum_package/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EntranceFader(
        duration: 700.milliseconds,
        delay: 500.milliseconds,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Connect with",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              RaisedButton(
                onPressed: Get.find<AuthController>().fbLogin,
                child: Text('Facebook'),
              ),
              RaisedButton(
                onPressed: Get.find<AuthController>().logByEmailAndPassword,
                child: Text('Email'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
