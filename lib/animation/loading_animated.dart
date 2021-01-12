import 'package:flutter/material.dart';

class LoadingAnimated extends StatelessWidget {
  final double size;
  final String color;

  const LoadingAnimated({Key key, this.size = 100, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
