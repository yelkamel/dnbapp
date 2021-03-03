import 'package:dnbapp/application/common/image_widget.dart';
import 'package:dnbapp/application/container/dnb_go_picker.dart';
import 'package:dnbapp/application/world/world_map.dart';
import 'package:dnbapp/application/world/world_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class DnbWorld extends StatelessWidget {
  const DnbWorld({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorldState>(
      init: WorldState(),
      builder: (state) => Container(
        color: Theme.of(context).accentColor,
        child: Stack(
          children: [
            WorldMap(state: state),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: DnbGoPicker(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
