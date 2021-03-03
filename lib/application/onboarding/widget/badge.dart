import 'package:dnbapp/application/common/entrance_container.dart';
import 'package:dnbapp/application/profil/edit/profil_badge_select.dart';
import 'package:dnbapp/controller/auth_controller.dart';
import 'package:flutter/material.dart';

import '../onboarding_state.dart';

class OnBoardingBadgeStep extends StatelessWidget {
  final OnBoardingState state;
  const OnBoardingBadgeStep(this.state, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        EntranceContainer(
          child: Text(
              "Select your badge, this will impact the radio, event on the map and the application theme.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4),
        ),
        SizedBox(height: 20),
        EntranceContainer(
          delay: Duration(milliseconds: 1000),
          child: SingleChildScrollView(child: BadgeSelectScreen()),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
