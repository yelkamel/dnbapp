import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DnbSelectedContainer extends StatelessWidget {
  final Widget child;
  final bool selected;
  const DnbSelectedContainer({
    Key key,
    this.child,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            selected ? Theme.of(context).backgroundColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            width: 10,
            color:
                !selected ? Colors.transparent : Theme.of(context).accentColor),
      ),
      child: child,
    );
  }
}
