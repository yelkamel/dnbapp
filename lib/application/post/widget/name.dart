import 'package:dnbapp/application/container/dnb_textinput.dart';
import 'package:dnbapp/crossapp/glass_container.dart';
import 'package:flutter/material.dart';

import '../post_state.dart';

class PostNameStep extends StatelessWidget {
  final PostState state;

  const PostNameStep({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 10,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: DnbTextInput(
          label: 'Name',
          hintText: 'feeling ? any words ?',
          onChanged: (value) => state.setField("name", value),
        ),
      ),
    );
  }
}
