import 'package:evolum_package/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressButton extends StatelessWidget {
  final int step;
  final int length;
  final void Function() onPress;
  const ProgressButton({
    this.step,
    Key key,
    this.onPress,
    this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 70.0;

    return EntranceFader(
      delay: 1.seconds,
      child: Stack(
        children: [
          SizedBox(
            width: size,
            height: size,
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          CircularStepProgressIndicator(
            totalSteps: length,
            currentStep: step,
            selectedColor: Theme.of(context).accentColor,
            unselectedColor: Theme.of(context).primaryColor,
            selectedStepSize: 8.0,
            stepSize: 4,
            width: size,
            height: size,
            child: RawMaterialButton(
              onPressed: onPress,
              child: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
