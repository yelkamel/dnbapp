import 'package:better_player/better_player.dart';
import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:flutter/material.dart';

class FeedVideo extends StatelessWidget {
  final PostModel post;
  const FeedVideo({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CloudStorage().getPostVideoById(post.id),
      builder: (context, snap) {
        if (snap.hasData) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: BetterPlayer.network(
              snap.data,
              betterPlayerConfiguration: BetterPlayerConfiguration(
                aspectRatio: 16 / 9,
              ),
            ),
          );
        }

        return Center(
          child: LoadingAnimated(
            size: 30,
          ),
        );
      },
    );
  }
}
