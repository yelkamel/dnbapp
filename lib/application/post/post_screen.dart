import 'package:dnbapp/animation/bullebackground.dart';
import 'package:dnbapp/application/post/post_state.dart';
import 'package:evolum_package/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'widget/step/end.dart';
import 'widget/step/intro.dart';
import 'widget/step/location.dart';
import 'widget/step/name.dart';
import 'widget/step/select.dart';
import 'widget/step/track.dart';
import 'widget/step/type.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Widget buildContent(PostState state, int index) {
    switch (state.steplist[index].toString()) {
      case 'intro':
        return PostIntroStep(state: state);
      case 'name':
        return PostNameStep(state: state);
      case 'track':
        return PostTrackStep(state: state);
      case 'type':
        return PostTypeStep(state: state);
      case 'select':
        return PostSelectStep(state: state);
      case 'end':
        return PostEndStep(state: state);
      case 'location':
        return PostLocationStep(state: state);
      default:
        return Center(child: Text('ERROR'));
    }
  }

  Widget buildBackButton(PostState state) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios,
          color: Theme.of(context).secondaryHeaderColor),
      onPressed: state.goBackStep,
    );
  }

  Widget buildProgresButton(PostState state) {
    return FadeInOutTransitionner(
      child: state.hideNext.value
          ? SizedBox(height: 70, width: 70)
          : CircularStepProgressIndicator(
              totalSteps: state.steplist.length,
              currentStep: state.step.value + 1,
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
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: PostState(),
      builder: (state) => Scaffold(
        appBar: AppBar(
          title: Text("Information about the Video",
              style: Theme.of(context).textTheme.subtitle1),
          elevation: 0,
          leading: buildBackButton(state),
        ),
        floatingActionButton: buildProgresButton(state),
        body: Swiper(
          physics: NeverScrollableScrollPhysics(),
          loop: false,
          itemBuilder: (BuildContext context, int index) {
            return buildContent(state, index);
          },
          itemCount: state.steplist.length,
          controller: state.controller,
          onIndexChanged: (i) => state.step.value = i,
        ),
      ),
    );
  }
}
