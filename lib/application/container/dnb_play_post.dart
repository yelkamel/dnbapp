import 'package:dnbapp/application/player/player_screen.dart';
import 'package:dnbapp/application/post/post_screen.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class DnbAddPost extends StatelessWidget {
  final PostModel post;
  const DnbAddPost(this.post, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => PlayerScreen.show(post),
      child: AnimatedGradientContainer(child:SizedBox(
        height: 40,
        width: 40,
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),),
    );
  }
}
