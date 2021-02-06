import 'package:dnbapp/animation/bullebackground.dart';
import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:dnbapp/application/container/dnb_textinput.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'profil_badge_select.dart';
import 'profil_edit_picture.dart';

class ProfilEditScreen extends HookWidget {
  const ProfilEditScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Get.find<UserController>().user;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profil",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme:
            IconThemeData(color: Theme.of(context).textTheme.subtitle1.color),
      ),
      body: BulleBackground(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                children: [
                  GlassContainer(
                    child: Row(
                      children: [
                        ProfilEditPicture(),
                        Expanded(
                          child: DnbTextInput(
                            text: user.name,
                            hintText: 'Add your name 😚',
                            label: 'Name',
                            initText: user.name,
                            onSubmitted: (name) {
                              Database().updateUser(user.id, {"name": name});
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GlassContainer(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Select your badge",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        BadgeSelectScreen(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
