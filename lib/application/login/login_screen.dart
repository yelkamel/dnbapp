import 'package:dnbapp/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Connexion"),
            RaisedButton(
              onPressed: Get.find<AuthController>().fbLogin,
              child: Text('connect FB'),
            ),
            RaisedButton(
              onPressed: Get.find<AuthController>().logByEmailAndPassword,
              child: Text('connect By Email'),
            )
          ],
        ),
      ),
    );
  }
}
