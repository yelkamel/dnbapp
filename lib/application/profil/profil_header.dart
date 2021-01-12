import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:dnbapp/application/container/dnb_icon.dart';
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
                    ProfilInfo(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: DnbIcon(
                onPressed: () => Get.toNamed("/edit"), icon: Icons.edit),
          ),
        ],
      ),
    );
  }
}
