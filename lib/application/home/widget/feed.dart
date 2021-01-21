import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'feed_item.dart';

class PostFeed extends StatelessWidget {
  const PostFeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: Database().postStream(),
        builder: (context, snap) {
          if (snap.hasData) {
            final List<PostModel> feed = snap.data;
            return ListView.builder(
              itemCount: feed.length,
              itemBuilder: (context, index) => FeedItem(post: feed[index]),
            );
          }

          return LoadingAnimated();
        },
      ),
    );
  }
}
