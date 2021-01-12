import 'package:dnbapp/application/home/widget/world.dart';
import 'package:dnbapp/application/radio/radio_container.dart';
import 'package:flutter/material.dart';

class MiddleTab extends StatefulWidget {
  const MiddleTab({Key key}) : super(key: key);

  @override
  _MiddleTabState createState() => _MiddleTabState();
}

class _MiddleTabState extends State<MiddleTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RadioContainer(),
          DnbWorld(),
        ],
      ),
    );
  }
}
