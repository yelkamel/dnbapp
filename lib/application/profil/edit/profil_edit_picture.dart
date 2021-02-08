import 'dart:io';

import 'package:dnbapp/application/container/dnb_icon.dart';
import 'package:dnbapp/application/container/dnb_user_picture.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilEditPicture extends StatefulWidget {
  const ProfilEditPicture({Key key}) : super(key: key);

  @override
  _ProfilEditPictureState createState() => _ProfilEditPictureState();
}

class _ProfilEditPictureState extends State<ProfilEditPicture> {
  File _image;
  final picker = ImagePicker();
  UploadTask _uploadTask;

  Future getImage() async {
    final user = Get.find<UserController>().user;

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _uploadTask = CloudStorage().uploadPictureFor(user.id, _image);
      } else {
        print('No image selected.');
      }
    });

    _uploadTask.whenComplete(() {
      Get.find<UserController>().update();
      setState(() {
        _image = null;
        _uploadTask = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          DnbUserPicture(uid: Get.find<UserController>().uid, size: 60),
          Positioned(
            right: -10,
            top: -10,
            child: DnbIcon(onPressed: getImage, icon: Icons.edit, size: 20),
          ),
        ],
      ),
    );
  }
}
