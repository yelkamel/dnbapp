import 'package:dnbapp/application/common/entrance_container.dart';
import 'package:dnbapp/controller/auth_controller.dart';
import 'package:flutter/material.dart';

import '../onboarding_state.dart';

class OnBoardingEndStep extends StatelessWidget {
  final OnBoardingState state;
  const OnBoardingEndStep(this.state, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        EntranceContainer(
          child: Text("Thanks for your registration",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4),
        ),
        SizedBox(height: 20),
        EntranceContainer(
          delay: Duration(milliseconds: 1000),
          child: Text("And enjoy ",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5),
        ),
        SizedBox(height: 20),
        RaisedButton(
          child: Text("Start"),
          onPressed: state.onFinishRegistration,
        )
      ],
    );
  }
}
