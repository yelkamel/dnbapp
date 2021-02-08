import 'package:dnbapp/application/world/world_state.dart';
import 'package:dnbapp/controller/post_controller.dart';
import 'package:evolum_package/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WorldMap extends StatelessWidget {
  final WorldState state;
  const WorldMap({this.state, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allposts = Get.find<PostController>().allPosts;
    Set<Circle> circles = Set.from([
      for (final post in allposts)
        Circle(
          circleId: CircleId(post.id),
          center: post.latlng,
          radius: 100000,
          fillColor: Theme.of(context).primaryColor,
          strokeWidth: 2,
          strokeColor: Theme.of(context).accentColor,
          consumeTapEvents: true,
          onTap: () => state.onFindPost(post),
        ),
    ]);

    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: state.onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(48.85661, 2.35222),
        zoom: 4,
      ),
      circles: circles,
    );
  }
}
