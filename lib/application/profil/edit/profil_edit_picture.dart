import 'dart:io';

import 'package:dnbapp/application/container/dnb_button.dart';
import 'package:dnbapp/application/container/dnb_icon.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../profil_picture.dart';

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

    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _uploadTask = CloudStorage().uploadPictureFor(user.id, _image);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DnbButton(
          child: Stack(
            children: [
              ProfilPicture(size: 80),
              Positioned(
                right: -10,
                top: -5,
                child: DnbIcon(icon: Icons.edit),
              )
            ],
          ),
          onPressed: getImage,
        ),
        if (_uploadTask != null)
          StreamBuilder<TaskSnapshot>(
              stream: _uploadTask.asStream(),
              builder: (_, snapshot) {
                var event = snapshot.data;

                double progressPercent = event != null
                    ? event.bytesTransferred / event.totalBytes
                    : 0;

                return LinearProgressIndicator(value: progressPercent);
              }),
      ],
    );
  }
}
