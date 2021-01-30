import 'package:dnbapp/application/container/dnb_textinput.dart';
import 'package:dnbapp/crossapp/glass_container.dart';
import 'package:flutter/material.dart';

import '../post_state.dart';

class PostTrackStep extends StatelessWidget {
  final PostState state;

  const PostTrackStep({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 10,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Track ID"),
            DnbTextInput(
              label: 'Main Producer Name',
              hintText: 'by who ?',
              onChanged: (value) => state.setField("producer", value),
            ),
            DnbTextInput(
              label: 'Track Name',
              hintText: 'and feat ',
              onChanged: (value) => state.setField("trackName", value),
            )
          ],
        ),
      ),
    );
  }
}
