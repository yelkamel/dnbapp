import 'package:animated_text/animated_text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dnbapp/application/common/entrance_container.dart';
import 'package:dnbapp/application/player/player_screen.dart';
import 'package:dnbapp/model/post_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'dnb_play_post.dart';
import 'dnb_user_picture.dart';

class DnbPostInfoTile extends StatelessWidget {
  final PostModel post;
  final bool picture;
  const DnbPostInfoTile({Key key, this.post, this.picture = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .subtitle1
        .copyWith(fontWeight: FontWeight.bold);

    return Stack(
      children: [
        if (picture)
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: DnbUserPicture(uid: post.uid, size: 40),
            ),
          ),
        Align(
          alignment: Alignment.topRight,
          child: DnbPlayPost(
            post,
            size: 40,
            onPress: () {},
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 8.0, right: 8.0),
              child: EntranceContainer(
                key: Key(post.id),
                delay: Duration(milliseconds: 500),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText(
                      post.name,
                      style: style,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      key: Key(post.id),
                    ),
                    SizedBox(height: 15),
                    EntranceContainer(
                      delay: Duration(milliseconds: 800),
                      child: AutoSizeText(
                        post.trackName,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
