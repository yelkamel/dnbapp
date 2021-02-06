import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'all_state.dart';
import 'widget/post_card.dart';

class AllPosts extends StatelessWidget {
  const AllPosts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AllState>(
      init: AllState(),
      builder: (state) => Expanded(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: PostCard(state.postsToShow[0])),
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
                  child: Text('Randomize'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
