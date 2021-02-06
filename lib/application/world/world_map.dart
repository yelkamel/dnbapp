import 'package:dnbapp/application/player/player_screen.dart';
import 'package:dnbapp/application/world/world_state.dart';
import 'package:evolum_package/main.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WorldMap extends StatelessWidget {
  final WorldState state;
  const WorldMap({this.state, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<Circle> circles = Set.from([
      Circle(
        circleId: CircleId(state.selectedPost.value.id),
        center: state.selectedPost.value.latlng,
        radius: 100000,
        fillColor: Theme.of(context).primaryColor,
        strokeWidth: 2,
        strokeColor: Theme.of(context).accentColor,
        consumeTapEvents: true,
        onTap: () => PlayerScreen.show(state.selectedPost.value),
      ),
    ]);

    return Center(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: EntranceFader(
          offset: Offset.zero,
          delay: Duration(milliseconds: 1200),
          duration: Duration(milliseconds: 700),
          child: ClipOval(
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: state.onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(48.85661, 2.35222),
                zoom: 4,
              ),
              circles: circles,
            ),
          ),
        ),
      ),
    );
  }
}
