import 'package:dnbapp/controller/radio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RadioPlayPauseTouchable extends GetWidget<RadioController> {
  final Widget child;

  const RadioPlayPauseTouchable({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: Theme.of(context).accentColor,
      onPressed: controller.playpause,
      child: child,
    );
  }
}
