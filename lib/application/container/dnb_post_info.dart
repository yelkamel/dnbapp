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
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DnbUserPicture(uid: post.uid, size: 40),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                  Text(
                    "${post.producer} - ${post.trackName}",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontSize: 12),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: DnbBadge(
                  size: 40,
                  badge: userPost.badge,
                ),
              ),
            ],
          );
        }
        return LoadingAnimated();
      },
    );
  }
}
