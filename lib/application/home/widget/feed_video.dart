import 'package:better_player/better_player.dart';
import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeedVideo extends StatelessWidget {
  final PostModel post;
  const FeedVideo(this.post, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,

      ///Orientation on full screen but only for start
      deviceOrientationsOnFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],

      ///Orientation after full screen dismissed
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
      controlsConfiguration: BetterPlayerControlsConfiguration(
        enableOverflowMenu: false,
        enableSkips: false,
      ),
    );

    return FutureBuilder(
      future: CloudStorage().getPostVideoById(post.id),
      builder: (context, snap) {
        if (snap.hasData) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: BetterPlayer.network(
              snap.data,
              betterPlayerConfiguration: betterPlayerConfiguration,
            ),
          );
        }

        return Expanded(
          child: Center(
            child: LoadingAnimated(
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
