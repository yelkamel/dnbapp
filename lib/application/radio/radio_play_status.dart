import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/controller/radio_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RadioPlayStatus extends HookWidget {
  const RadioPlayStatus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animatedController =
        useAnimationController(duration: 500.milliseconds);

    return Obx(() {
      final radio = Get.find<RadioController>();
      if (radio.playing.value) {
        animatedController.forward();
      } else {
        animatedController.reverse();
      }

      if (radio.loading.value) {
        return SizedBox(height: 25, width: 25, child: LoadingAnimated());
      }

      return AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: animatedController,
      );
    });
  }
}
