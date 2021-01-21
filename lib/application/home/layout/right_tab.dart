import 'package:dnbapp/animation/bullebackground.dart';
import 'package:dnbapp/application/home/widget/feed.dart';
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
    return BulleBackground(
      maxBubble: 10,
      color: Theme.of(context).accentColor,
      child: Column(
        children: [
          SizedBox(height: 20),
          PostFeed(),
        ],
      ),
    );
  }
}
