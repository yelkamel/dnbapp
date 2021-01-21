import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'world_container.dart';

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
    final size = MediaQuery.of(context).size.width * 0.85;
    return WorldContainer(
      width: size,
      height: size + 20,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Card(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.person),
                ),
              ),
              Center(
                child: Container(
                  width: size - 50,
                  height: size - 50,
                  child: ClipOval(
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      onMapCreated: _onMapCreated,
                      mapType: MapType.terrain,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Sick Heavy Name style",
                      style: Theme.of(context).textTheme.subtitle1),
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("location",
                        style: Theme.of(context).textTheme.subtitle1),
                  )),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Post Type",
                        style: Theme.of(context).textTheme.subtitle1),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
