import 'package:auto_size_text/auto_size_text.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/container/dnb_user_picture.dart';
import 'package:dnbapp/application/user/all_user_state.dart';
import 'package:dnbapp/application/user/widget/search_user.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:evolum_package/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllUserList extends StatelessWidget {
  const AllUserList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchUser(
      child: GetX<AllUserState>(
        init: AllUserState(),
        builder: (state) => state.loading.value
            ? Center(child: LoadingAnimated())
            : StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: state.allUser.length,
                staggeredTileBuilder: (int index) => new StaggeredTile.count(
                    2, state.allUser[index].nbpost > 0 ? 2 : 1),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                itemBuilder: (BuildContext context, int index) {
                  final user = state.allUser[index];

                  if (user.id == Get.find<UserController>().uid) {
                    return Container();
                  }

                  return Container(
                    child: RawMaterialButton(
                      onPressed: () {
                        Get.toNamed("/profil", arguments: user);
                      },
                      child: GlassContainer(
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: DnbUserPicture(uid: user.id),
                                    ),
                                    AutoSizeText(
                                      user.name,
                                      maxLines: 1,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    )
                                  ],
                                ),
                                if (user.nbpost > 0)
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      '${user.nbpost} video${user.nbpost > 1 ? "s" : ""}',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
