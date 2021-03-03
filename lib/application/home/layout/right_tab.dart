import 'package:dnbapp/application/container/dnb_go_box.dart';
import 'package:dnbapp/application/container/dnb_go_map.dart';
import 'package:dnbapp/application/container/dnb_go_userprofil.dart';
import 'package:dnbapp/application/pickpost/pickpost.dart';
import 'package:dnbapp/application/radio/radio_container.dart';

import 'package:flutter/material.dart';

class RightTab extends StatefulWidget {
  const RightTab({Key key}) : super(key: key);

  @override
  _RightTabState createState() => _RightTabState();
}

class _RightTabState extends State<RightTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: RadioContainer(),
        ),
        Align(
          alignment: Alignment.center,
          child: PickPost(),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: DnbGoMap(),
        ),
        Align(
          alignment: Alignment.topRight,
          child: DnbGoUserProfil(),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: DnbGoBox(),
        ),
      ],
    );
  }
}
