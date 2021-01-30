import 'package:dnbapp/application/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PostProgressButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final state = Get.find<PostState>();
        return CircularStepProgressIndicator(
          totalSteps: state.steplist.length,
          currentStep: state.step.value,
          selectedColor: Theme.of(context).primaryColor.withOpacity(0.9),
          unselectedColor: Theme.of(context).primaryColor.withOpacity(0.4),
          selectedStepSize: 6.0,
          stepSize: 3,
          height: 70,
          width: 70,
          child: FloatingActionButton(
            onPressed: state.goNextStep,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.add_box),
            ),
          ),
        );
      },
    );
  }
}
