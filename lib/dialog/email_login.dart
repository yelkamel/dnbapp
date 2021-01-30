import 'package:dnbapp/animation/bullebackground.dart';
import 'package:dnbapp/application/container/dnb_textinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class EmailLoginDialog extends HookWidget {
  const EmailLoginDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = useState("");
    final password = useState("");

    return Dialog(
      elevation: 5.0,
      clipBehavior: Clip.hardEdge,
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: BulleBackground(
          maxSizeBubble: 35,
          nbOfBubble: 15,
          color: Theme.of(context).accentColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DnbTextInput(
                  label: "email",
                  onChanged: (value) {
                    email.value = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DnbTextInput(
                  obscureText: true,
                  label: "password",
                  onChanged: (value) {
                    password.value = value;
                  },
                ),
              ),
              RaisedButton(
                onPressed: () => Get.back(result: {
                  "email": email.value,
                  "password": password.value,
                }),
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
