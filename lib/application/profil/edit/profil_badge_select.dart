import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/application/container/dnb_selected.dart';
import 'package:dnbapp/controller/radio_controller.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/service/database.dart';
import 'package:dnbapp/theme/warrioz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class BadgeSelectScreen extends HookWidget {
  const BadgeSelectScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Get.find<UserController>().user.value;
    final badgeId = useState(user.badgeId);

    return Column(
      children: [
        for (final badge in Get.find<RadioController>().badges)
          DnbSelectedContainer(
            selected: badgeId.value == badge.id,
            child: DnbBadge(
              imageOnly: false,
              onSelect: () async {
                Get.changeThemeMode(ThemeMode.dark);

                print('===> [Badge] select ${badge.id}');
                await Database().updateUser(user.id, {
                  "badgeId": badge.id,
                });
                Get.find<RadioController>().start();
                if (badge.id == "warriorz_fr") {
                  Get.changeTheme(warriorzTheme);
                }
                badgeId.value = badge.id;
              },
              badgeId: badge.id,
            ),
          ),
      ],
    );
  }
}
