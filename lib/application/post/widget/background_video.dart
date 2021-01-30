import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PostBackgroundVideo extends StatefulWidget {
  final File file;
  final bool autoPlay;

  const PostBackgroundVideo({Key key, this.file, this.autoPlay = true})
      : super(key: key);
  @override
  _PostBackgroundVideoState createState() => _PostBackgroundVideoState();
}

class _PostBackgroundVideoState extends State<PostBackgroundVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(
      widget.file,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )..initialize().then((_) {
        _controller.setLooping(true);
        if (widget.autoPlay) _controller.play();

        /*  _controller.seekTo(
            Duration(
              seconds:
                  Random().nextInt(_controller.value.duration.inSeconds - 20),
            ),
          );*/

        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
