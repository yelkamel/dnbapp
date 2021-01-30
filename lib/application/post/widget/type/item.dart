import 'package:flutter/material.dart';

class PostTypeItem extends StatelessWidget {
  final String type;

  const PostTypeItem({Key key, this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onAccept: (value) {},
      onLeave: (value) {},
      builder: (context, item, __) {
        return Container(
            color: Colors.blueGrey,
            height: 50,
            width: 50,
            child: Text(item.toString()));
      },
    );
  }
}
