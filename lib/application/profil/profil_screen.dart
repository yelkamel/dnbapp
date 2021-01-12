import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:dnbapp/application/profil/profil_header.dart';
import 'package:dnbapp/application/profil/profil_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sliver_fab/sliver_fab.dart';

import 'profil_info.dart';
import 'profil_video.dart';

class ProfilScreen extends HookWidget {
  final double headerHeight;
  const ProfilScreen({Key key, this.headerHeight = 250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFab(
      floatingWidget: ProfilHeader(),
      floatingPosition: FloatingPosition(left: 40, top: -30),
      expandedHeight: headerHeight,
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: headerHeight,
          pinned: true,
          flexibleSpace: ProfilVideo(height: headerHeight),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            List.generate(
              30,
              (int index) => ListTile(title: Text("Item $index")),
            ),
          ),
        ),
      ],
    );
  }
}
