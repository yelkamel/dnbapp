import 'package:dnbapp/application/box/box_screen.dart';
import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/application/profil/profil_state.dart';
import 'package:dnbapp/controller/radio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'post.dart';

class ProfilTresor extends StatelessWidget {
  final ProfilState state;
  const ProfilTresor(this.state, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final post in state.savedPosts) ProfilPost(post: post),
        ],
      ),
    );
  }
}
