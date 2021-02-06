import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/application/container/dnb_selected.dart';
import 'package:dnbapp/controller/radio_controller.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/badge_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class BadgeSelectScreen extends HookWidget {
  const BadgeSelectScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = Get.find<UserController>().user;

      return Column(
        children: [
          for (final badge in Get.find<RadioController>().badges)
            DnbSelectedContainer(
              selected: user.badgeId == badge.id,
              child: DnbBadge(
                imageOnly: false,
                onSelect: () async {
                  await Database().updateUser(user.id, {
                    "badgeId": badge.id,
                  });
                  Get.find<RadioController>().start();
                },
                badgeId: badge.id,
              ),
            ),
        ],
      );
    });
  }
}
