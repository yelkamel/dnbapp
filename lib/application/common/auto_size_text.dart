import 'package:flutter/material.dart';

class AutoSizeText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const AutoSizeText(this.text, {Key key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(text, maxLines: 1, style: style),
      ),
    );
  }
}
