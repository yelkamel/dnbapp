import 'package:auto_size_text/auto_size_text.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/container/dnb_user_picture.dart';
import 'package:dnbapp/application/user/all_user_state.dart';
import 'package:dnbapp/application/user/widget/search_user.dart';
import 'package:dnbapp/application/user/widget/user_button.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:evolum_package/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllUserList extends StatelessWidget {
  const AllUserList({Key key}) : super(key: key);

  StaggeredTile gridTile(int index, UserModel user) {
    return StaggeredTile.count(2, 1);
  }

  @override
  Widget build(BuildContext context) {
    return SearchUser(
      child: GetX<AllUserState>(
        init: AllUserState(),
        builder: (state) => state.loading.value
            ? Center(child: LoadingAnimated())
            : SingleChildScrollView(
                child: Wrap(
                  children: [
                    for (var user in state.allUser)
                      if (user.id != Get.find<UserController>().uid)
                        UserButton(user: user)
                  ],
                ),
              ),
      ),
    );
  }
}
