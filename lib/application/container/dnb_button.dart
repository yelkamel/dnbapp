import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DnbButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final NeumorphicShape shape;
  const DnbButton({
    Key key,
    this.child,
    this.onPressed,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPressed,
      style: NeumorphicStyle(
        shape: NeumorphicShape.convex,
        color: Theme.of(context).cardColor,
      ),
      padding: const EdgeInsets.all(12.0),
      child: child,
    );
  }
}
