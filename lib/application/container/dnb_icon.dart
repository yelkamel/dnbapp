import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DnbIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double size;
  final NeumorphicShape shape;
  const DnbIcon({
    Key key,
    this.icon,
    this.onPressed,
    this.size = 15,
    this.shape = NeumorphicShape.concave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
      child: Container(
        child: Icon(
          icon,
          size: size,
        ),
      ),
    );
  }
}
