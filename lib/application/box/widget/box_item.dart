import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dnbapp/application/common/entrance_container.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/common/spreadshadow_container.dart';
import 'package:dnbapp/application/container/dnb_play_post.dart';
import 'package:dnbapp/application/player/player_screen.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:flutter/material.dart';

class BoxItem extends StatelessWidget {
  final PostModel post;
  const BoxItem(this.post, {Key key}) : super(key: key);

  Widget buildCard(BuildContext context) {
    final style = Theme.of(context).textTheme.headline6.copyWith(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );
    final subStyle = Theme.of(context).textTheme.headline6.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w200,
          color: Colors.white,
        );
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: DnbPlayPost(
            post,
            size: 80,
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
                  SizedBox(height: 50),
                  EntranceContainer(
                    delay: Duration(milliseconds: 800),
                    child: AutoSizeText(
                      post.trackName,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: subStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SpreadShadowContainer(
      backgroundColor: Theme.of(context).accentColor,
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        openBuilder: (BuildContext context, VoidCallback _) {
          return PlayerScreen(post);
        },
        closedElevation: 6.0,
        closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        closedColor: Theme.of(context).colorScheme.secondary,
        closedBuilder: (BuildContext context, VoidCallback openContainer) =>
            Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          ),
          child: buildCard(context),
        ),
      ),
    );
/*
    RawMaterialButton(
      onPressed: () {
        PlayerScreen.show(post);
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: DnbPlayPost(
              post,
              size: 80,
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
                      SizedBox(height: 50),
                      EntranceContainer(
                        delay: Duration(milliseconds: 800),
                        child: AutoSizeText(
                          post.trackName,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: subStyle,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );*/
  }
}
