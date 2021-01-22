import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:dnbapp/application/profil/widget/profil_wave.dart';
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
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: ProfilWave(),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: DnbCard(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
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
          ),
        ],
      ),
    );
  }
}
