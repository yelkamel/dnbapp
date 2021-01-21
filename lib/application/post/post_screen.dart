import 'package:better_player/better_player.dart';
import 'package:dnbapp/application/container/dnb_animated_button.dart';
import 'package:dnbapp/application/container/dnb_button.dart';
import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:dnbapp/application/container/dnb_textinput.dart';
import 'package:dnbapp/application/post/post_state.dart';
import 'package:dnbapp/application/post/post_background_video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: PostState(),
      builder: (_) {
        final state = Get.find<PostState>();
        if (state.step.value == PostStep.select) return Container();
        return Scaffold(
          appBar: AppBar(
            title: Text("New Video To Show",
                style: Theme.of(context).textTheme.subtitle1),
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: state.submitPost,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.add_box),
            ),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: PostBackgroundVideo(file: state.file),
                ),
                Column(
                  children: [
                    DnbTextInput(
                      label: 'Name',
                      hintText: 'feeling ? any words ?',
                      onChanged: (value) => state.setField("name", value),
                    ),
                    DnbCard(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Track ID"),
                            DnbTextInput(
                              label: 'Main Producer Name',
                              hintText: 'by who ?',
                              onChanged: (value) =>
                                  state.setField("producer", value),
                            ),
                            DnbTextInput(
                              label: 'Track Name',
                              hintText: 'and feat ',
                              onChanged: (value) =>
                                  state.setField("trackName", value),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
