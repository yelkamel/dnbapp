import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:dnbapp/application/container/dnb_user_picture.dart';
import 'package:dnbapp/application/profil/profil_state.dart';
import 'package:dnbapp/application/profil/widget/wave.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'info.dart';

class ProfilHeader extends StatelessWidget {
  final ProfilState state;
  const ProfilHeader(this.state, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: ProfilWave(),
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 140,
            child: DnbCard(
              child: Center(
                child: DnbUserPicture(uid: state.user.id, size: 60),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
