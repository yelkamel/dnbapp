import 'package:animations/animations.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/common/image_widget.dart';
import 'package:dnbapp/application/profil/profil_screen.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dnb_user_picture.dart';

class DnbGoPicker extends StatelessWidget {
  const DnbGoPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RawMaterialButton(
          onPressed: Get.back,
          child: GlassContainer(
            child: SizedBox(
              height: 60,
              width: 60,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageWidget(
                    "assets/icon/card.svg",
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 70),
      ],
    );
  }
}
