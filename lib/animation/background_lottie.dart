import 'package:dnbapp/crossapp/lottie_animated.dart';
import 'package:flutter/cupertino.dart';

class BackgroundLottie extends StatelessWidget {
  const BackgroundLottie({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: LottieAnimated(
          repeat: true, url: "assets/lottie/background/jumpcoeur.json"),
    );
  }
}
