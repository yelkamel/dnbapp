import 'package:dnbapp/application/container/dnb_button.dart';
import 'package:dnbapp/application/container/dnb_icon.dart';
import 'package:dnbapp/application/container/dnb_textinput.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'profil_edit_picture.dart';

class ProfilEditScreen extends HookWidget {
  const ProfilEditScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Get.find<UserController>().user;
    final nameTextController = useTextEditingController(text: user.name);

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profil"),
      ),
      floatingActionButton: DnbIcon(
        size: 35,
        onPressed: () async {
          await Database()
              .updateUser(user.id, {"name": nameTextController.text});

          Get.back();
        },
        icon: Icons.save,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              children: [
                ProfilEditPicture(),
                SizedBox(height: 20),
                DnbTextInput(
                  controller: nameTextController,
                  label: 'Name',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
