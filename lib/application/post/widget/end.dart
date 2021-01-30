import 'package:dnbapp/crossapp/glass_container.dart';
import 'package:flutter/material.dart';

import '../post_state.dart';

class PostEndStep extends StatelessWidget {
  final PostState state;

  const PostEndStep({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 10,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
            "Merci veuillez ne pas quitter l'application avant la fin de l'upload de video en qualité max!"),
      ),
    );
  }
}
