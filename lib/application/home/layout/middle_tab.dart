import 'package:animations/animations.dart';
import 'package:dnbapp/animation/bullebackground.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/container/dnb_add_post.dart';
import 'package:dnbapp/application/container/dnb_button.dart';
import 'package:dnbapp/application/container/dnb_user_picture.dart';
import 'package:dnbapp/application/home/widget/upload_progress.dart';
import 'package:dnbapp/application/profil/profil_screen.dart';
import 'package:dnbapp/application/world/world.dart';
import 'package:dnbapp/application/radio/radio_container.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class MiddleTab extends StatefulWidget {
  const MiddleTab({Key key}) : super(key: key);

  @override
  _MiddleTabState createState() => _MiddleTabState();
}

class _MiddleTabState extends State<MiddleTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: RadioContainer(),
        ),
        Align(
          alignment: Alignment.topRight,
          child: UploadCircularProgress(),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: GlassContainer(
            child: SizedBox(
              height: 100,
              width: 100,
              child: OpenContainer(
                transitionType: ContainerTransitionType.fade,
                openBuilder: (BuildContext context, VoidCallback _) {
                  return const DnbWorld();
                },
                closedElevation: 6.0,
                closedColor: Theme.of(context).colorScheme.secondary,
                closedBuilder:
                    (BuildContext context, VoidCallback openContainer) {
                  return SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.map,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: GlassContainer(
            child: SizedBox(
              height: 100,
              width: 100,
              child: OpenContainer(
                transitionType: ContainerTransitionType.fade,
                openBuilder: (BuildContext context, VoidCallback _) {
                  return const ProfilScreen();
                },
                closedElevation: 6.0,
                closedColor: Theme.of(context).colorScheme.secondary,
                closedBuilder:
                    (BuildContext context, VoidCallback openContainer) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DnbUserPicture(
                      size: 60,
                      uid: Get.find<UserController>().uid,
                      currentUser: true,
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
