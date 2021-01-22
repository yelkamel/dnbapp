import 'package:better_player/better_player.dart';
import 'package:dnbapp/application/container/dnb_add_post.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:dnbapp/widget/simple_video.dart';
import 'package:evolum_package/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profil_state.dart';

class ProfilVideo extends StatelessWidget {
  final double height;
  const ProfilVideo({Key key, this.height}) : super(key: key);

  Widget buildVideo(PostModel post) {
    return FutureBuilder(
      future: CloudStorage().getPostVideoById(post.id),
      builder: (context, snap) {
        if (snap.hasData) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: SimpleVideo(url: snap.data),
          );
        }

        return Center(
          child: LoadingAnimated(
            size: 30,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final state = Get.find<ProfilState>();

      if (state.posts.isEmpty) {
        return Center(
          child: DnbAddPost(),
        );
      }

      return buildVideo(state.posts.first);
    });
  }
}
