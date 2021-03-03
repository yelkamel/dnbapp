import 'package:dnbapp/animation/bullebackground.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/common/progress_button.dart';
import 'package:dnbapp/application/common/spreadshadow_container.dart';
import 'package:dnbapp/application/onboarding/onboarding_state.dart';
import 'package:dnbapp/application/onboarding/widget/badge.dart';
import 'package:dnbapp/application/onboarding/widget/intro.dart';
import 'package:dnbapp/application/onboarding/widget/picture.dart';
import 'package:dnbapp/application/onboarding/widget/pseudo.dart';
import 'package:evolum_package/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

import 'widget/end.dart';

class OnBoardingScreen extends StatelessWidget {
  Widget buildContent(OnBoardingState state, int index) {
    switch (state.currentStep) {
      case "intro":
        return OnBoardingIntroStep();
      case "pseudo":
        return OnBoardingPseudoStep(state);
      case 'picture':
        return OnBoardingPicture();
      case 'badge':
        return OnBoardingBadgeStep(state);
      case 'end':
        return OnBoardingEndStep(state);
      default:
        return LoadingAnimated();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<OnBoardingState>(
      init: OnBoardingState(),
      builder: (state) => Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: state.currentStep != "end"
              ? ProgressButton(
                  onPress: state.swipNext,
                  step: state.step.value + 1,
                  length: state.steplist.length,
                )
              : SizedBox(),
        ),
        body: SafeArea(
          child: BulleBackground(
            color: Theme.of(context).primaryColor,
            nbOfBubble: 10,
            maxSizeBubble: 30,
            child: Swiper(
              physics: NeverScrollableScrollPhysics(),
              loop: false,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GlassContainer(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: buildContent(state, index),
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.steplist.length,
              controller: state.controller,
              onIndexChanged: (i) => state.step.value = i,
            ),
          ),
        ),
      ),
    );
  }
}
