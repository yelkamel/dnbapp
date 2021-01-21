import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DnbCard extends StatelessWidget {
  final Widget child;
  final Color shadowColor;
  const DnbCard({Key key, this.child, this.shadowColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      child: child,
      shadowColor: shadowColor,
    );
  }
}
