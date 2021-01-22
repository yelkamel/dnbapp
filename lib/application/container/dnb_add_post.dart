import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dnb_button.dart';

class DnbAddPost extends StatelessWidget {
  const DnbAddPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DnbButton(
      onPress: () {
        Get.toNamed("/post");
      },
      shape: CircleBorder(),
      child: Icon(
        Icons.add,
        size: 30,
      ),
    );
  }
}
