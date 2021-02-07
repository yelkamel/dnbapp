import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/container/dnb_button.dart';
import 'package:dnbapp/application/container/dnb_user_picture.dart';
import 'package:dnbapp/application/profil/profil_screen.dart';
import 'package:dnbapp/application/user/all_user.dart';
import 'package:dnbapp/controller/auth_controller.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftTab extends StatefulWidget {
  const LeftTab({Key key}) : super(key: key);

  @override
  _LeftTabState createState() => _LeftTabState();
}

class _LeftTabState extends State<LeftTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AllUserList(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RaisedButton(
              shape: CircleBorder(
                side:
                    BorderSide(width: 6, color: Theme.of(context).primaryColor),
              ),
              onPressed: () => Get.toNamed("/profil"),
              child:
                  DnbUserPicture(size: 60, uid: Get.find<UserController>().uid),
            ),
          ),
        )
      ],
    );
  }
}
