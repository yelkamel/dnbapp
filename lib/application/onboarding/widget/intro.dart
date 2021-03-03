import 'package:dnbapp/application/common/entrance_container.dart';
import 'package:flutter/material.dart';

class OnBoardingIntroStep extends StatelessWidget {
  const OnBoardingIntroStep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        EntranceContainer(
          child: Text("Hello And welcome \n to Dnb App",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4),
        ),
        SizedBox(height: 30),
        EntranceContainer(
          delay: Duration(milliseconds: 1000),
          child: Text("You will have quality content focus on dnb only",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5),
        ),
        SizedBox(height: 15),
        EntranceContainer(
          delay: Duration(milliseconds: 1500),
          child: Text(
              "no infinit scroll or algo, each content will by a piece of art to find",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1),
        ),
        SizedBox(height: 30),
        EntranceContainer(
          delay: Duration(milliseconds: 2000),
          child: Text("There is also a radio",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5),
        ),
        SizedBox(height: 15),
        EntranceContainer(
          delay: Duration(milliseconds: 2500),
          child: Text(
              "if you need to dance just open the app and listen to the banger",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
