import 'package:dnbapp/application/container/dnb_button.dart';
import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:dnbapp/application/container/dnb_icon.dart';
import 'package:dnbapp/application/world/world.dart';
import 'package:dnbapp/application/radio/radio_container.dart';
import 'package:dnbapp/controller/radio_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: RadioContainer(),
        ),
        DnbWorld(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: DnbIcon(
              icon: Icons.add,
              size: 30,
              shape: NeumorphicShape.convex,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
