import 'package:dnbapp/controller/radio_controller.dart';
import 'package:dnbapp/crossapp/lottie_animated.dart';
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
      child: RadioPlayPauseTouchable(
        child: SizedBox(
          height: 40,
          width: 40,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.4,
                child: LottieAnimated(
                  url: "assets/lottie/radio.json",
                  repeat: true,
                ),
              ),
              Align(alignment: Alignment.center, child: RadioPlayStatus()),
            ],
          ),
        ),
      ),
    );
  }
}
