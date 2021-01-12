import 'package:dnbapp/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RightTab extends StatefulWidget {
  const RightTab({Key key}) : super(key: key);

  @override
  _RightTabState createState() => _RightTabState();
}

class _RightTabState extends State<RightTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Settings"),
        RaisedButton(
          onPressed: Get.find<AuthController>().signOut,
          child: Text("Deconexion"),
        )
      ],
    );
  }
}
