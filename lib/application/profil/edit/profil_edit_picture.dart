import 'dart:io';

import 'package:dnbapp/application/container/dnb_button.dart';
import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:dnbapp/application/container/dnb_icon.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
      Get.find<UserController>().updateProfilPicture();
      setState(() {
        _image = null;
        _uploadTask = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DnbCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ProfilPicture(size: 80),
            Positioned(
              right: -5,
              top: 0,
              child: DnbIcon(onPressed: getImage, icon: Icons.edit, size: 15),
            ),
            if (_uploadTask != null)
              Center(
                child: Container(
                  width: 80,
                  child: StreamBuilder<TaskSnapshot>(
                      stream: _uploadTask.asStream(),
                      builder: (_, snapshot) {
                        var event = snapshot.data;

                        double progressPercent = event != null
                            ? event.bytesTransferred / event.totalBytes
                            : 0;

                        return NeumorphicProgress(percent: progressPercent);
                      }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
