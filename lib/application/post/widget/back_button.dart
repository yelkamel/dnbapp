import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../post_state.dart';

class PostBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Get.find<PostState>();

    return IconButton(
      icon: Icon(Icons.arrow_back_ios,
          color: Theme.of(context).secondaryHeaderColor),
      onPressed: state.goBackStep,
    );
  }
}
