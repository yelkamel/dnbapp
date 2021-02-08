import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/world/world_map.dart';
import 'package:dnbapp/application/world/world_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'world_container.dart';

class DnbWorld extends StatelessWidget {
  const DnbWorld({Key key}) : super(key: key);

  Widget buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: RawMaterialButton(
        onPressed: Get.back,
        fillColor: Theme.of(context).accentColor,
        constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
        padding: EdgeInsets.all(5),
        shape: CircleBorder(),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Theme.of(context).accentColor),
          ),
          child: Icon(
            Icons.arrow_back_sharp,
          ),
        ),
      ),
    );
  }

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
                alignment: Alignment.topLeft,
                child: buildBackButton(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
