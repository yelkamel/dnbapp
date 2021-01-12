import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DnbIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double size;
  final NeumorphicShape shape;
  const DnbIcon(
      {Key key,
      this.icon,
      this.onPressed,
      this.size = 15,
      this.shape = NeumorphicShape.concave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPressed,
      style: NeumorphicStyle(
        color: Theme.of(context).backgroundColor,
        shape: shape,
        boxShape: NeumorphicBoxShape.circle(),
      ),
      child: NeumorphicIcon(
        icon,
        size: size,
        style: NeumorphicStyle(
          shape: NeumorphicShape.convex,
          color: Theme.of(context).iconTheme.color,
          surfaceIntensity: 5.0,
        ),
      ),
    );
  }
}
