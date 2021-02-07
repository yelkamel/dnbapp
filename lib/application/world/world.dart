import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:dnbapp/application/common/image_widget.dart';
import 'package:dnbapp/application/container/dnb_post_info_row.dart';
import 'package:dnbapp/application/world/world_map.dart';
import 'package:dnbapp/application/world/world_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';

import 'widget/world_flag.dart';
import 'world_container.dart';

class DnbWorld extends StatelessWidget {
  const DnbWorld({Key key}) : super(key: key);

  Widget buildContent(WorldState state, BuildContext context) {
    if (state.isClose)
      return GlassContainer(
        child: Expanded(
          child: Container(
            color: Theme.of(Get.context).backgroundColor,
            child: IconButton(
              icon: ImageWidget(
                "assets/icon/world.svg",
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                state.status.value = "open";
              },
            ),
          ),
        ),
      );

    return WorldContainer(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Card(
          child: Column(
            children: [
              state.posts.isEmpty
                  ? LoadingAnimated()
                  : DnbPostInfoRow(state.selectedPost.value),
              Expanded(
                child: Stack(
                  children: [
                    WorldMap(state: state),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: WorldFlag(state.selectedPost.value),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: state.goNext,
                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetX<WorldState>(
      init: WorldState(),
      builder: (state) => AnimatedContainer(
        duration: 1.seconds,
        height: state.isClose ? 100 : Get.size.height * 0.55,
        width: state.isClose ? 200 : Get.size.width * 0.85,
        child: AnimatedSwitcher(
          duration: 1.seconds,
          child: buildContent(state, context),
        ),
      ),
    );
  }
}
