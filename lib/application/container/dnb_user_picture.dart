import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DnbUserPicture extends StatelessWidget {
  final String uid;
  final double size;
  final bool currentUser;
  const DnbUserPicture(
      {Key key, this.uid, this.size = 40, this.currentUser = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentUser) {
      final urlCurrentUser = Get.find<UserController>().userPicture;

      if (urlCurrentUser == null)
        return IconButton(
          icon: Icon(Icons.add_a_photo),
          onPressed: () {},
        );

      return ClipOval(
        child: ExtendedImage.network(
          Get.find<UserController>().userPicture,
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
    }

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
