import 'package:animations/animations.dart';
import 'package:dnbapp/application/box/box_screen.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/common/image_widget.dart';
import 'package:flutter/material.dart';

class DnbGoBox extends StatelessWidget {
  const DnbGoBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: SizedBox(
        height: 60,
        width: 60,
        child: OpenContainer(
          transitionType: ContainerTransitionType.fade,
          openBuilder: (BuildContext context, VoidCallback _) {
            return const UserBox();
          },
          closedElevation: 6.0,
          closedColor: Theme.of(context).accentColor,
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ImageWidget(
                "assets/icon/deck.svg",
                color: Theme.of(context).iconTheme.color,
              ),
            );
          },
        ),
      ),
    );
  }
}
