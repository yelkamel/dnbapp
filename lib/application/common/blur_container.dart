import 'dart:ui';

import 'package:flutter/material.dart';

const double kBlur = 1.0;
const Color kDefaultColor = Colors.transparent;
const double kColorOpacity = 0.0;

class BlurContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double height, width;
  final Color bgColor;

  const BlurContainer({
    @required this.child,
    this.blur = 5,
    this.height,
    this.width,
    this.bgColor = kDefaultColor,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        height: height,
        width: width,
        color:
            bgColor == Colors.transparent ? bgColor : bgColor.withOpacity(0.5),
        child: child,
      ),
    );
  }
}
