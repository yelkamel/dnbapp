import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DnbButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final EdgeInsets padding;
  const DnbButton({
    Key key,
    this.child,
    this.onPressed,
    this.padding = const EdgeInsets.all(12.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPressed,
      style: NeumorphicStyle(
        shape: NeumorphicShape.convex,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
        color: Theme.of(context).cardColor,
      ),
      padding: padding,
      child: child,
    );
  }
}
