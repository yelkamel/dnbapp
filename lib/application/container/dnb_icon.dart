import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DnbIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double size;
  const DnbIcon({
    Key key,
    this.icon,
    this.onPressed,
    this.size = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
      fillColor: Theme.of(context).accentColor,
      shape: CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Icon(
          icon,
          size: size,
        ),
      ),
    );
  }
}
