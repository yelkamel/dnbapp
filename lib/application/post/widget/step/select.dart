import 'package:dnbapp/application/container/dnb_button.dart';
import 'package:dnbapp/crossapp/glass_container.dart';
import 'package:flutter/material.dart';

import '../../post_state.dart';

class PostSelectStep extends StatelessWidget {
  final PostState state;

  const PostSelectStep({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        blur: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Please select the video you wanna upload, be sur to not leave the application until the upload finish.",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: DnbButton(
                child: Text("Select Video From Phone"),
                onPress: state.getVideoToUpload,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
