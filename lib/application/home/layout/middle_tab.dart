import 'package:dnbapp/application/home/widget/upload_progress.dart';
import 'package:dnbapp/application/radio/radio_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: RadioContainer(),
        ),
        Align(
          alignment: Alignment.topRight,
          child: UploadCircularProgress(),
        ),
      ],
    );
  }
}
