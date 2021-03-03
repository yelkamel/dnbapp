import 'package:animations/animations.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/world/world.dart';
import 'package:flutter/material.dart';

class DnbGoMap extends StatelessWidget {
  const DnbGoMap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 0,
      child: SizedBox(
        height: 60,
        width: 60,
        child: OpenContainer(
          transitionType: ContainerTransitionType.fade,
          openBuilder: (BuildContext context, VoidCallback _) {
            return Scaffold(
              backgroundColor: Theme.of(context).accentColor,
              body: const DnbWorld(),
            );
          },
          closedElevation: 6.0,
          closedColor: Theme.of(context).accentColor,
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
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
    );
  }
}
