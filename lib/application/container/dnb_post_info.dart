import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter/material.dart';

import 'dnb_badge.dart';
import 'dnb_user_picture.dart';

class DnbPostInfo extends StatelessWidget {
  final PostModel post;
  const DnbPostInfo({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: Database().getUserById(post.uid),
      builder: (context, snap) {
        if (snap.hasData) {
          final userPost = snap.data;
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: DnbUserPicture(uid: post.uid, size: 40),
                  ),
                  Text(
                    post.name.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  DnbBadge(
                    size: 40,
                    badge: userPost.badge,
                  ),
                ],
              ),
              Text(
                "${post.producer} - ${post.trackName}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 12),
              ),
            ],
          );
        }
        return LoadingAnimated();
      },
    );
  }
}
