import 'package:dnbapp/application/common/entrance_container.dart';
import 'package:dnbapp/application/container/dnb_selected.dart';
import 'package:dnbapp/application/container/dnb_textinput.dart';
import 'package:dnbapp/application/onboarding/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingPseudoStep extends StatelessWidget {
  final OnBoardingState state;
  const OnBoardingPseudoStep(this.state, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          EntranceContainer(
            child: Text("But first provide your artist name",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4),
          ),
          SizedBox(height: 20),
          EntranceContainer(
            delay: Duration(milliseconds: 1000),
            child: DnbTextInput(
              initText: state.name.value,
              onChanged: (value) => state.name.value = value.capitalizeFirst,
            ),
          ),
          SizedBox(height: 20),
          EntranceContainer(
            delay: Duration(milliseconds: 1500),
            child: Text("and select your category",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4),
          ),
          SizedBox(height: 20),
          for (final type in ["Dancer", "Dj", "Raver"])
            EntranceContainer(
                delay: Duration(milliseconds: 2000),
                child: DnbSelectedContainer(
                  selected: type == state.type.value,
                  child: RawMaterialButton(
                    onPressed: () => state.type.value = type,
                    child: Text(type,
                        style: Theme.of(context).textTheme.subtitle2),
                  ),
                )),
        ],
      );
    });
  }
}
