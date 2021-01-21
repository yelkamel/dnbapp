import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DnbButton extends StatelessWidget {
  final Widget child;
  final Function onPress;
  final EdgeInsets padding;
  final ShapeBorder shape;
  final Color color;
  const DnbButton({
    Key key,
    this.child,
    this.onPress,
    this.padding = const EdgeInsets.all(12.0),
    this.shape = const RoundedRectangleBorder(),
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 10,
      fillColor: color ?? Theme.of(context).accentColor,
      padding: padding,
      shape: shape,
      child: child,
    );
  }
}
