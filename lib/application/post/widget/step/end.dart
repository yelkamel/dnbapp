import 'package:dnbapp/crossapp/glass_container.dart';
import 'package:flutter/material.dart';

import '../../post_state.dart';

class PostEndStep extends StatelessWidget {
  final PostState state;

  const PostEndStep({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        blur: 10,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Thanks for sharing",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
