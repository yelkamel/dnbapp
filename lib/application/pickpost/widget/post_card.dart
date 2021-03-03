import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/application/player/player_screen.dart';
import 'package:flip_card/flip_card.dart';
import 'package:dnbapp/application/container/dnb_post_info_tile.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../pickpost_state.dart';

class PostCard extends HookWidget {
  final PostModel post;
  const PostCard(this.post, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final open = useState(false);
    return Obx(() {
      final state = Get.find<PickPostState>();
      final index = state.postsToShow.indexWhere((p) => p.id == post.id);

      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.5,
        child: FlipCard(
          flipOnTouch: !open.value,
          onFlip: () {
            open.value = true;
            print("Index: $index");
          },
          direction: FlipDirection.HORIZONTAL, // default
          back: GlassContainer(
            blur: 10,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: open.value
                  ? RawMaterialButton(
                      onPressed: () {
                        state.randomize();
                        PlayerScreen.show(post);
                      },
                      child: DnbPostInfoTile(
                        post: post,
                      ),
                    )
                  : Container(),
            ),
          ),

          front: GlassContainer(
            blur: 10,
            child: Container(
              child: DnbBadge(
                badgeId: post.badgeId,
              ),
            ),
          ),
        ),
      );
    });
  }
}
