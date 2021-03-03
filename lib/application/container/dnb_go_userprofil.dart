import 'package:animations/animations.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/profil/edit/profil_edit_screen.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DnbGoUserProfil extends StatelessWidget {
  const DnbGoUserProfil({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: SizedBox(
        height: 60,
        width: 60,
        child: OpenContainer(
          transitionType: ContainerTransitionType.fade,
          openBuilder: (BuildContext context, VoidCallback _) {
            return const ProfilEditScreen();
          },
          closedElevation: 6.0,
          closedColor: Theme.of(context).accentColor,
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            final user = Get.find<UserController>().user.value;

            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(width: 4, color: Theme.of(context).accentColor),
              ),
              child: ClipOval(
                child: Image.asset("assets/image/badge/${user.badgeId}.jpg"),
              ),
            );
          },
        ),
      ),
    );
  }
}
