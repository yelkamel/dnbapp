import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:flutter/material.dart';

class DnbUserPicture extends StatelessWidget {
  final String uid;
  final double size;
  const DnbUserPicture({Key key, this.uid, this.size = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CloudStorage().getPictureFor(uid),
      builder: (context, snap) {
        if (!snap.hasData) return LoadingAnimated(size: 20);
        return Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Theme.of(context).accentColor),
          ),
          child: ClipOval(
            child: Image.network(snap.data),
          ),
        );
      },
    );
  }
}
