import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/common/spreadshadow_container.dart';
import 'package:dnbapp/controller/radio_controller.dart';
import 'package:dnbapp/application/common/lottie_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'playpause_touchable.dart';
import 'radio_play_status.dart';

class RadioContainer extends GetWidget<RadioController> {
  const RadioContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SpreadShadowContainer(
        spread: 10,
        child: GlassContainer(
          margin: EdgeInsets.all(0),
          child: RawMaterialButton(
            onPressed: controller.playpause,
            constraints: BoxConstraints(maxWidth: 50),
            child: RadioPlayStatus(),
          ),
        ),
      ),
    );
  }
}
