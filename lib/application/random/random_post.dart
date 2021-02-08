import 'package:dnbapp/animation/loading_animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'random_post_state.dart';
import 'widget/post_card.dart';

class AllPost extends StatelessWidget {
  const AllPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<RandomPostState>(
      init: RandomPostState(),
      builder: (state) => Expanded(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: state.loading.value
              ? LoadingAnimated()
              : Stack(
                  children: [
                    Align(
                      key: Key("topCenter+${state.postsToShow[0].id}"),
                      alignment: Alignment.topCenter,
                      child: PostCard(state.postsToShow[0]),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: PostCard(state.postsToShow[1])),
                    Align(
                        alignment: Alignment.centerRight,
                        child: PostCard(state.postsToShow[2])),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(50),
                        child: RaisedButton(
                          onPressed: state.randomize,
                          child: Text(
                            'Randomize',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
