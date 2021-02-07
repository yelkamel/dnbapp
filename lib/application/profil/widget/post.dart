import 'package:dnbapp/application/container/dnb_post_info_tile.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:flutter/material.dart';

class ProfilPost extends StatelessWidget {
  final PostModel post;
  const ProfilPost({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.4,
        child: DnbPostInfoTile(
          picture: false,
          post: post,
        ),
      ),
    );
  }
}
