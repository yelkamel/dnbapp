import 'package:dnbapp/application/world/world_state.dart';
import 'package:evolum_package/main.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WorldMap extends StatelessWidget {
  final WorldState state;
  const WorldMap({this.state, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: EntranceFader(
          delay: Duration(milliseconds: 1000),
          child: ClipOval(
            child: GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: state.onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(48.85661, 2.35222),
                zoom: 4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
