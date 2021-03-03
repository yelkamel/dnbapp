import 'package:dnbapp/application/common/image_widget.dart';
import 'package:dnbapp/application/player/player_screen.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:flutter/material.dart';

class DnbPlayPost extends StatelessWidget {
  final PostModel post;
  final double size;
  const DnbPlayPost(this.post, {Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        PlayerScreen.show(post);
      },
      child: SizedBox(
        height: size,
        width: size,
        child: ImageWidget(
          "assets/icon/play_video.svg",
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
