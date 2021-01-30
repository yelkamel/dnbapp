import 'package:dnbapp/crossapp/glass_container.dart';
import 'package:flutter/material.dart';

import '../../post_state.dart';
import 'item.dart';

class PostTypeStep extends StatelessWidget {
  final PostState state;

  const PostTypeStep({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: PostTypeItem(type: 'top'),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            color: Colors.deepOrange,
            height: 50,
            width: 50,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: Colors.blue,
            height: 50,
            width: 50,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Draggable<String>(
            data: 'none',
            feedback: Container(
              color: Colors.blueGrey.withOpacity(0.7),
              height: 50,
              width: 50,
              child: Icon(Icons.people),
            ),
            child: Container(
              color: Colors.green,
              height: 50,
              width: 50,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Colors.red,
            height: 50,
            width: 50,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            color: Colors.green,
            height: 50,
            width: 50,
          ),
        )
      ],
    );
  }
}
