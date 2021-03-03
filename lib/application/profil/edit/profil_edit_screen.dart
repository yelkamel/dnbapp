import 'package:dnbapp/application/common/image_widget.dart';
import 'package:dnbapp/application/container/dnb_textinput.dart';
import 'package:dnbapp/application/menu/drawer_menu.dart';
import 'package:dnbapp/application/profil/widget/video_list.dart';
import 'package:dnbapp/application/profil/widget/wave.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../profil_state.dart';
import 'profil_badge_select.dart';
import 'profil_edit_picture.dart';

class ProfilEditScreen extends HookWidget {
  const ProfilEditScreen({Key key}) : super(key: key);
  Widget buildBackButton() {
    return IconButton(
      icon: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(Get.context).textTheme.subtitle1.color,
      ),
      onPressed: Get.back,
    );
  }

  Widget buildIconSvg(BuildContext context, String url) {
    return ImageWidget(
      url,
      height: 30,
      width: 30,
      color: Theme.of(context).textTheme.bodyText1.color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2, initialIndex: 0);

    final user = Get.find<UserController>().user.value;

    return DrawerMenu(
      child: GetX<ProfilState>(
        init: ProfilState(user),
        builder: (state) => Container(
          color: Theme.of(context).backgroundColor,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ProfilWave(),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 50),
                        ProfilEditPicture(size: 45),
                        Expanded(
                          child: DnbTextInput(
                            text: user.name,
                            hintText: 'Add your name 😚',
                            label: 'Dancer',
                            initText: user.name,
                            onSubmitted: (name) {
                              Database().updateUser(user.id, {"name": name});
                            },
                          ),
                        ),
                        buildBackButton()
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TabBar(
                  controller: tabController,
                  tabs: [
                    Tab(icon: buildIconSvg(context, "assets/icon/radio.svg")),
                    Tab(icon: buildIconSvg(context, "assets/icon/step.svg")),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Select your Radio",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          BadgeSelectScreen(),
                        ],
                      ),
                      ProfilVideoList(state)
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
