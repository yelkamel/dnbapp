import 'package:country_code_picker/country_code_picker.dart';
import 'package:dnbapp/model/post_model.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class WorldFlag extends StatelessWidget {
  final PostModel post;
  const WorldFlag(
    this.post, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 100,
        child: Text(
          post.type,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
