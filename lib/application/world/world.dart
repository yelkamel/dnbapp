import 'package:dnbapp/animation/loading_animated.dart';
import 'package:dnbapp/application/container/dnb_post_info.dart';
import 'package:dnbapp/application/world/world_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'world_container.dart';

class DnbWorld extends StatelessWidget {
  const DnbWorld({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.85;
    return GetX<WorldState>(
      init: WorldState(),
      builder: (state) => WorldContainer(
        height: size + 80,
        width: size,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Card(
            child: Column(
              children: [
                state.posts.isEmpty
                    ? LoadingAnimated()
                    : DnbPostInfo(
                        post: state.posts.first,
                      ),
                Expanded(
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: size - 50,
                          height: size - 50,
                          child: ClipOval(
                            child: GoogleMap(
                              zoomControlsEnabled: false,
                              onMapCreated: state.onMapCreated,
                              mapType: MapType.terrain,
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(48.85661, 2.35222), zoom: 4),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: state.goToTheLake,
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: state.goToTheLake,
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
      ),
    );
  }
}
