import 'package:dnbapp/controller/radio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'playpause_touchable.dart';
import 'radio_play_status.dart';

class RadioContainer extends GetWidget<RadioController> {
  const RadioContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          RadioPlayPauseTouchable(child: RadioPlayStatus()),
        ],
      ),
    );
  }
}
