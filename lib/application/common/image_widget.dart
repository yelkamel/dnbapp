import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final Color color;
  const ImageWidget(
    this.url, {
    this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.contains(".svg")) {
      return SvgPicture.asset(url, color: color);
    }

    return Image.asset(url);
  }
}
