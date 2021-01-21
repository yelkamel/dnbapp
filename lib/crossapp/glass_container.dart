import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final BorderRadius borderRadius;
  const GlassContainer(
      {Key key, this.child, this.blur = 10.0, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: child,
      ),
    );
  }
}
