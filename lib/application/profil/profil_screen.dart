import 'dart:async';

import 'package:dnbapp/application/common/image_widget.dart';
import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/application/profil/widget/header.dart';
import 'package:dnbapp/application/profil/profil_state.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:evolum_package/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'widget/stats.dart';
import 'widget/tresor.dart';

class ProfilScreen extends HookWidget {
  final UserModel user;
  const ProfilScreen({Key key, this.user}) : super(key: key);

  static void show(UserModel user) {
    scheduleMicrotask(
      () => showCupertinoModalBottomSheet(
        context: Get.context,
        topRadius: Radius.circular(30),
        backgroundColor: Colors.transparent,
        builder: (context) => ProfilScreen(user: user),
      ),
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

    return GetX<ProfilState>(
      init: ProfilState(user),
      builder: (state) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_downward_rounded),
            onPressed: Get.back,
          ),
          centerTitle: true,
          title: Text(state.user.name),
          actions: [
            DnbBadge(
              onSelect: () {},
              size: 40,
              badgeId: user.badgeId,
            )
          ],
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: state.loading.value
              ? LoadingAnimated()
              : Column(
                  children: [
                    ProfilHeader(state),
                    TabBar(
                      controller: tabController,
                      tabs: [
                        Tab(
                            icon: buildIconSvg(
                                context, "assets/icon/collection.svg")),
                        Tab(
                            icon:
                                buildIconSvg(context, "assets/icon/step.svg")),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          ProfilTresor(state),
                          ProfilInfoList(state),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
