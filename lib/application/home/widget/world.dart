import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DnbWorld extends StatefulWidget {
  const DnbWorld({Key key}) : super(key: key);

  @override
  _DnbWorldState createState() => _DnbWorldState();
}

class _DnbWorldState extends State<DnbWorld> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          target: _center,
        ),
      ),
    );
  }
}
