import 'package:auto_size_text/auto_size_text.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:flutter/material.dart';

import 'dnb_badge.dart';
import 'dnb_user_picture.dart';

class DnbPostInfoRow extends StatelessWidget {
  final PostModel post;
  const DnbPostInfoRow(this.post, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            AutoSizeText(
              post.name.toString(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            DnbBadge(
              badgeId: post.badgeId,
              size: 40,
            ),
          ],
        ),
        Text(
          "${post.producer} - ${post.trackName}",
          style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
