import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/application/container/dnb_button.dart';
import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:dnbapp/application/container/dnb_icon.dart';
import 'package:dnbapp/application/container/dnb_user_picture.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'profil_info.dart';
import 'profil_picture.dart';

class ProfilHeader extends StatelessWidget {
  const ProfilHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DnbCard(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfilPicture(),
                    /*
                    DnbUserPicture(
                      uid: Get.find<UserController>().uid,
                      size: 100,
                    ),*/
                    ProfilInfo(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Obx(() {
              final user = Get.find<UserController>().user;
              return DnbBadge(
                onSelect: () => Get.toNamed("/edit"),
                size: 40,
                badge: user.badge,
              );
            }),
          ),
        ],
      ),
    );
  }
}
