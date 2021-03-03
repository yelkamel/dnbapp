import 'package:dnbapp/application/common/image_widget.dart';
import 'package:flutter/material.dart';

class DnbUserPicture extends StatelessWidget {
  final String uid;
  final double size;
  const DnbUserPicture({Key key, @required this.uid, this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Theme.of(context).accentColor),
          shape: BoxShape.circle,
        ),
        child: ImageWidget(
          "gs://jumpcoeur.appspot.com/profilpicture/$uid",
          width: size,
          height: size,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
