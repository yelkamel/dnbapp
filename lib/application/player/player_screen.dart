import 'dart:async';

import 'package:dnbapp/application/home/widget/feed_video.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PlayerScreen extends StatelessWidget {
  final PostModel post;
  const PlayerScreen(this.post, {Key key}) : super(key: key);

  static void show(PostModel post) {
    scheduleMicrotask(
      () => showCupertinoModalBottomSheet(
        context: Get.context,
        topRadius: Radius.circular(30),
        backgroundColor: Colors.transparent,
        builder: (context) => PlayerScreen(post),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.name),
        actions: [Icon(Icons.save)],
      ),
      body: Center(child: FeedVideo(post)),
    );
  }
}
