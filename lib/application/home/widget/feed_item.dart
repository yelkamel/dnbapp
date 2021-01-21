import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/application/container/dnb_user_picture.dart';
import 'package:dnbapp/crossapp/glass_container.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter/material.dart';

import 'feed_video.dart';

class FeedItem extends StatelessWidget {
  final PostModel post;
  const FeedItem({
    Key key,
    this.post,
  }) : super(key: key);

  Widget buildContent(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: Database().getUserById(post.uid),
      builder: (context, snap) {
        if (snap.hasData) {
          final userPost = snap.data;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DnbUserPicture(uid: userPost.id, size: 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      post.name,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.headset),
                  ),
                ],
              ),
              FeedVideo(post: post),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DnbBadge(
                      size: 40,
                      badge: userPost.badge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${post.producer} - ${post.trackName}",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.share),
                  ),
                ],
              ),
            ],
          );
        }
        return LoadingAnimated();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      ),
      child: GlassContainer(blur: 10, child: buildContent(context)),
    );
  }
}
