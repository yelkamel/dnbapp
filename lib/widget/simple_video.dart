import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SimpleVideo extends StatefulWidget {
  final String url;
  const SimpleVideo({Key key, this.url}) : super(key: key);

  @override
  _SimpleVideoState createState() => _SimpleVideoState();
}

class _SimpleVideoState extends State<SimpleVideo> {
  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
      widget.url,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )..initialize().then((_) {
        controller.setVolume(0);
        controller.setLooping(true);
        controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  }
}
