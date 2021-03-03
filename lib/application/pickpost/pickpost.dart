import 'package:dnbapp/animation/loading_animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pickpost_state.dart';
import 'widget/post_card.dart';

class PickPost extends StatelessWidget {
  const PickPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: GetX<PickPostState>(
        init: PickPostState(),
        builder: (state) => AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: state.loading.value
              ? LoadingAnimated()
              : Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: PostCard(state.postsToShow[0]),
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: PostCard(state.postsToShow[1])),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: PostCard(state.postsToShow[2])),
                  ],
                ),
        ),
      ),
    );
  }
}
