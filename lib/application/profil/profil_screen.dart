import 'package:dnbapp/application/profil/profil_header.dart';
import 'package:dnbapp/application/profil/profil_picture.dart';
import 'package:dnbapp/application/profil/profil_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'profil_info.dart';
import 'profil_video.dart';

class ProfilScreen extends HookWidget {
  final double headerHeight;
  const ProfilScreen({Key key, this.headerHeight = 250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfilVideo(height: headerHeight),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: headerHeight - 50),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ProfilPicture(),
                        ProfilInfo(),
                      ],
                    ),
                    ProfilPost()
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
