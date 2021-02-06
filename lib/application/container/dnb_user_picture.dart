import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:extended_image/extended_image.dart';
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
        return ClipOval(
          child: ExtendedImage.network(
            snap.data,
            width: size,
            height: size,
            fit: BoxFit.fill,
            cache: true,
            border: Border.all(width: 2, color: Theme.of(context).accentColor),
            shape: BoxShape.circle,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            //cancelToken: cancellationToken,
          ),
        );
      },
    );
  }
}
