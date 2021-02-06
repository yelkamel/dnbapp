import 'package:animated_text/animated_text.dart';
import 'package:dnbapp/application/common/auto_size_text.dart';
import 'package:dnbapp/application/common/entrance_container.dart';
import 'package:dnbapp/model/post_model.dart';

import 'package:flutter/material.dart';

import 'dnb_user_picture.dart';

class DnbPostInfoTile extends StatelessWidget {
  final PostModel post;
  const DnbPostInfoTile({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .subtitle1
        .copyWith(fontWeight: FontWeight.bold);

    final listName = post.name.split(" ");

    return Stack(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: DnbUserPicture(uid: post.uid, size: 40),
            )),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: listName.length < 2
                ? EntranceContainer(
                    key: Key(post.id),
                    delay: Duration(milliseconds: 500),
                    child: AutoSizeText(
                      post.name,
                      style: style,
                      key: Key(post.id),
                    ),
                  )
                : AnimatedText(
                    alignment: Alignment.center,
                    speed: Duration(milliseconds: 1000),
                    controller: AnimatedTextController.loop,
                    displayTime: Duration(milliseconds: 1000),
                    wordList: listName,
                    textStyle: style,
                    onAnimate: (index) {
                      // print("Animating index:" + index.toString());
                    },
                    onFinished: () {
                      // print("Animtion finished");
                    },
                  ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: EntranceContainer(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 70),
              Text(
                post.trackName,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 12),
              ),
            ],
          )),
        ),
      ],
    );
  }
}
