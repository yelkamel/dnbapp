import 'package:dnbapp/application/home/widget/feed_video.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:flutter/material.dart';

class ProfilPost extends StatelessWidget {
  final PostModel post;
  const ProfilPost({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 15,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ExpansionTile(
          title: Text(
            post.name,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          subtitle: Text(
            "${post.producer} - ${post.trackName}",
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
          children: [
            SizedBox(height: 200, child: FeedVideo(post: post)),
          ],
        ),
      ),
    );
  }
}
