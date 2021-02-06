import 'package:dnbapp/application/container/dnb_textinput.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../post_state.dart';

class PostTrackStep extends StatelessWidget {
  final PostState state;

  const PostTrackStep({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
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
                onChanged: (value) =>
                    state.post.producer = value.capitalizeFirst,
                initText: state.post.producer,
              ),
              DnbTextInput(
                label: 'Track Name',
                hintText: 'and feat ',
                onChanged: (value) =>
                    state.post.trackName = value.capitalizeFirst,
                initText: state.post.trackName,
              )
            ],
          ),
        ),
      ),
    );
  }
}
