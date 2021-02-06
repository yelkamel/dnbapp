import 'package:dnbapp/application/post/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class DnbAddPost extends StatelessWidget {
  const DnbAddPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (BuildContext context, VoidCallback _) {
        return const PostScreen();
      },
      closedElevation: 6.0,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      closedColor: Theme.of(context).colorScheme.secondary,
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return SizedBox(
          height: 40,
          width: 40,
          child: Icon(
            Icons.add,
            size: 30,
          ),
        );
      },
    );
  }
}
