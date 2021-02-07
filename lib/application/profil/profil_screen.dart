import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/application/menu/drawer_menu.dart';
import 'package:dnbapp/application/profil/widget/header.dart';
import 'package:dnbapp/application/profil/profil_state.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'widget/stats.dart';
import 'widget/tresor.dart';
import 'widget/video_list.dart';

class ProfilScreen extends HookWidget {
  final double headerHeight;
  const ProfilScreen({Key key, this.headerHeight = 250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Get.arguments as UserModel;

    final isCurrentUser = user == null;

    final tabController = useTabController(initialLength: 3, initialIndex: 1);

    return GetX<ProfilState>(
      init: ProfilState(
        isCurrentUser ? Get.find<UserController>().user : user,
        currentUser: isCurrentUser,
      ),
      builder: (state) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_downward_rounded),
            onPressed: Get.back,
          ),
          centerTitle: true,
          title: Text(state.user.name),
          actions: [
            if (isCurrentUser)
              Obx(() {
                final user = Get.find<UserController>().user;

                return DnbBadge(
                  onSelect: () => Get.toNamed("/edit"),
                  size: 40,
                  badgeId: user.badgeId,
                );
              }),
          ],
        ),
        body: Column(
          children: [
            ProfilHeader(state),
            TabBar(
              controller: tabController,
              tabs: [
                Tab(icon: Icon(Icons.saved_search)),
                Tab(icon: Icon(Icons.personal_video)),
                Tab(icon: Icon(Icons.info)),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ProfilTresor(state),
                  ProfilVideoList(state),
                  ProfilInfoList(state),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
