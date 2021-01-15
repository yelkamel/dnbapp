import 'package:dnbapp/application/container/dnb_card.dart';
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
    final size = MediaQuery.of(context).size.width * 0.85;
    return DnbCard(
      child: Container(
        width: size,
        height: size,
        child: Stack(
          children: [
            Align(alignment: Alignment.topLeft, child: Icon(Icons.person)),
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
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: size * 0.35,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Sick Heavy Name style",
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                )),
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
    );
  }
}
