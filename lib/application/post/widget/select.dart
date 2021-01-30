import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/crossapp/glass_container.dart';
import 'package:flutter/material.dart';

import '../post_state.dart';

class PostSelectStep extends StatelessWidget {
  final PostState state;

  const PostSelectStep({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 10,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: LoadingAnimated(),
      ),
    );
  }
}
