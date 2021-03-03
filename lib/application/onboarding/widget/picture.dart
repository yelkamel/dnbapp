import 'package:dnbapp/application/profil/edit/profil_edit_picture.dart';
import 'package:flutter/material.dart';

class OnBoardingPicture extends StatelessWidget {
  const OnBoardingPicture({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "One Last thing, please upload a nice picture for your page",
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(height: 30),
        ProfilEditPicture(size: 100),
        SizedBox(height: 20),
      ],
    );
  }
}
