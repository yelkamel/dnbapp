import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WorldMap extends StatefulWidget {
  WorldMap({Key key}) : super(key: key);

  @override
  _WorldMapState createState() => _WorldMapState();
}

class _WorldMapState extends State<WorldMap> {
  GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _setMapStyle();
  }

  Future _setMapStyle() async {
    final String style = await DefaultAssetBundle.of(context)
        .loadString('assets/map/warriorz.json');
    print('===> [Wordl] set map style');
    _mapController.setMapStyle(style);
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: GoogleMap(
        zoomControlsEnabled: false,
        onMapCreated: _onMapCreated,
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          target: LatLng(48.85661, 2.35222),
        ),
      ),
    );
  }
}
