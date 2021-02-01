import 'package:dnbapp/animation/bullebackground.dart';
import 'package:dnbapp/application/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'widget/back_button.dart';
import 'widget/progress_button.dart';
import 'widget/step/end.dart';
import 'widget/step/intro.dart';
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
      default:
        return Center(child: Text('ERROR'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = Get.put<PostState>(PostState());

    return Scaffold(
      appBar: AppBar(
        title: Text("Information about the Video",
            style: Theme.of(context).textTheme.subtitle1),
        elevation: 0,
        leading: PostBackButton(),
      ),
      floatingActionButton: PostProgressButton(),
      body: BulleBackground(
        color: Theme.of(context).primaryColor,
        child: Swiper(
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
