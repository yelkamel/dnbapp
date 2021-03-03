import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_image/firebase_image.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final Color color;
  final double height;
  final double width;
  final BoxFit fit;

  const ImageWidget(
    this.url, {
    this.color,
    Key key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.contains(".svg")) {
      return SvgPicture.asset(
        url,
        color: color,
        width: width,
        height: height,
      );
    }

    if (url.contains("gs")) {
      return Image(
        image: FirebaseImage(
          url,
          cacheRefreshStrategy: CacheRefreshStrategy.NEVER,
        ),
        fit: fit,
        height: height,
        width: width,
      );
    }

    return Image.asset(
      url,
      width: width,
      height: height,
    );
  }
}
