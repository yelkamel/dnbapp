import 'package:flutter/material.dart';

class ProfilVideo extends StatelessWidget {
  final double height;
  const ProfilVideo({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      color: Colors.green,
    );
  }
}
