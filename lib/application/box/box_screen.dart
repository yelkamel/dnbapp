import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/application/box/box_state.dart';
import 'package:dnbapp/application/box/widget/box_carrousel.dart';
import 'package:dnbapp/application/container/dnb_go_picker.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/badge_filter.dart';

class UserBox extends StatelessWidget {
  final UserModel user;
  const UserBox({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<BoxState>(
        init: BoxState(Get.find<UserController>().user.value),
        builder: (state) => AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: state.loading.value
              ? Expanded(
                  child: Container(
                      color: Theme.of(context).accentColor,
                      child: LoadingAnimated()))
              : SafeArea(
                  child: Container(
                    child: Stack(
                      children: [
                        state.boxPosts.isEmpty
                            ? Center(
                                child: Text(
                                  "Go Check some video 😉",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              )
                            : BoxCarrousel(state),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: BadgeFilter(
                              selectedBadgeId: state.badgeId.value,
                              onSelect: (val) {
                                state.badgeId.value = val;
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: DnbGoPicker(),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
