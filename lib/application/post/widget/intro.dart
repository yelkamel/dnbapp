import 'package:dnbapp/crossapp/glass_container.dart';
import 'package:flutter/material.dart';

import '../post_state.dart';

class PostIntroStep extends StatelessWidget {
  final PostState state;

  const PostIntroStep({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 10,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
            "Bienvenu dans l'interface, afin de montrer une vidéo de dance DNB au monde."),
      ),
    );
  }
}
