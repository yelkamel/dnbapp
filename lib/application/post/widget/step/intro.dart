import 'package:dnbapp/crossapp/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../post_state.dart';

class PostIntroStep extends StatelessWidget {
  final PostState state;

  const PostIntroStep({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final state = Get.find<PostState>();

        return Center(
          child: GlassContainer(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Hello, you are ready to upload a video of dance on DnB. \n\nPlease be sure that it's complete this condition",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  for (final text in state.checklistStr)
                    ListTile(
                      trailing: Checkbox(
                        value: state.checklist.contains(text),
                        onChanged: (value) =>
                            state.onSelectAgreement(text, value),
                        activeColor: Theme.of(context).primaryColor,
                      ),
                      title: Text(text),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
