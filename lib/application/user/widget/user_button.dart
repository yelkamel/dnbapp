import 'package:auto_size_text/auto_size_text.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/container/dnb_user_picture.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserButton extends StatelessWidget {
  final UserModel user;
  const UserButton({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: RawMaterialButton(
        onPressed: () {
          Get.toNamed("/profil", arguments: user);
        },
        child: GlassContainer(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: DnbUserPicture(uid: user.id),
                ),
                Expanded(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AutoSizeText(
                        user.name,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${user.nbOfPost} 📹',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          '${user.nbOfSaved} 💿',
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
