import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DnbCard extends StatelessWidget {
  final Widget child;
  const DnbCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.convex,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        depth: 3,
        lightSource: LightSource.topLeft,
        color: Theme.of(context).cardColor,
      ),
      child: child,
    );
  }
}
