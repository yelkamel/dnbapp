import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:dnbapp/controller/radio_controller.dart';
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
      padding: const EdgeInsets.all(10.0),
      child: RadioPlayPauseTouchable(child: RadioPlayStatus()),
    );
  }
}
