import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/application/profil/widget/profil_header.dart';
import 'package:dnbapp/application/profil/profil_state.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'widget/profil_post.dart';

class ProfilScreen extends HookWidget {
  final double headerHeight;
  const ProfilScreen({Key key, this.headerHeight = 250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return GetX<ProfilState>(
      init: ProfilState(),
      builder: (state) => Container(
        color: Theme.of(context).backgroundColor,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false,
              elevation: 10,
              backgroundColor: Theme.of(context).backgroundColor,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: ProfilHeader(),
              ),
              actions: [
                Obx(() {
                  final user = Get.find<UserController>().user;

                  return DnbBadge(
                    onSelect: () => Get.toNamed("/edit"),
                    size: 40,
                    badge: user.badge,
                  );
                }),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                for (var post in state.posts) ProfilPost(post: post),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
