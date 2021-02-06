import 'package:dnbapp/application/all/all_state.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:flip_card/flip_card.dart';
import 'package:dnbapp/application/container/dnb_post_info_tile.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class PostCard extends HookWidget {
  final PostModel post;
  const PostCard(this.post, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = Get.find<AllState>();

    final index = state.postsToShow.indexWhere((p) => p.id == post.id);

    return SizedBox(
      key: Key(post.id),
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.6,
      child: FlipCard(
        key: Key(post.id),
        flipOnTouch: true,
        onFlip: () {
          state.opens[index] = true;
        },
        direction: FlipDirection.HORIZONTAL, // default
        back: GlassContainer(
          blur: 10,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child:
                state.opens[index] ? DnbPostInfoTile(post: post) : Container(),
          ),
        ),

        front: GlassContainer(
          blur: 10,
          child: Expanded(
            child: Container(
              child: DnbBadge(
                badgeId: post.badgeId,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
