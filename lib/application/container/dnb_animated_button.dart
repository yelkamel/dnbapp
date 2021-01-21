import 'package:evolum_package/main.dart';
import 'package:flutter/material.dart';

class DnbAnimatedButton extends StatelessWidget {
  final Widget child;
  final Function onPress;
  const DnbAnimatedButton({
    Key key,
    this.child,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = [
      Theme.of(context).primaryColor,
      Theme.of(context).accentColor,
    ];
    return RawMaterialButton(
      onPressed: onPress,
      child: AnimatedGradientContainer(
        colors: colors,
        borderRadius: BorderRadius.circular(10),
        boxShape: BoxShape.rectangle,
        child: child,
      ),
    );
  }
}
