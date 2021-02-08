import 'package:dnbapp/application/random/random_post.dart';

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
    return Expanded(
      child: Column(
        children: [
          AllPost(),
        ],
      ),
    );
  }
}
