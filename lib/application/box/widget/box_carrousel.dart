import 'package:dnbapp/application/box/box_state.dart';
import 'package:flutter/material.dart';
import 'package:perspective_pageview/perspective_pageview.dart';

import 'box_item.dart';

class BoxCarrousel extends StatelessWidget {
  final BoxState state;
  const BoxCarrousel(this.state, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PerspectivePageView(
      hasShadow: false, // Enable-Disable Shadow
      shadowColor:
          Theme.of(context).backgroundColor.withOpacity(0.2), // Change Color
      aspectRatio: PVAspectRatio.ONE_ONE, // Aspect Ratio of 1:1 (Default)
      children: <Widget>[for (var post in state.boxPosts) BoxItem(post)],
    );
  }
}
