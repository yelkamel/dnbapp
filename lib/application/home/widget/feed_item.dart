import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/application/container/dnb_post_info.dart';
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

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 10,
      child: ExpansionTile(
        title: DnbPostInfo(post: post),
        children: [
          SizedBox(height: 200, child: FeedVideo(post: post)),
        ],
      ),
    );
  }
}
