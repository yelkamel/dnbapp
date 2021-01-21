import 'package:dnbapp/application/container/dnb_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'dart:math';

const style = TextStyle(
  color: Colors.white,
  fontFamily: 'AirbnbCereal',
  fontSize: 35,
);

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      width: double.infinity,
      color: Color(0xff342B4D),
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Hello And Welcome",
            style: style,
          ),
          Text(
            "To the first Dnb Social Media",
            style: style,
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      color: Color(0xff51437C),
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Listen to Radio when you want",
            style: style,
          ),
          Text(
            "Don't was time to find banger tunes, it's comme to you",
            style: style,
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      color: Color(0xffC0CDE7),
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Post your favorite dance video",
            style: style.copyWith(color: Colors.black87),
          ),
          Text(
            "with no limite and on high quality",
            style: style.copyWith(color: Colors.black87),
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      color: Color(0xff9EE0FD),
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Check dance video from dancer of all over the world",
              style: style.copyWith(color: Colors.black87)),
          Text("slow down there move, try to figure out what is the trick",
              style: style.copyWith(color: Colors.black87)),
          Text("and no need to ask the track id, it's just here",
              style: style.copyWith(color: Colors.black87)),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      color: Color(0xffDDDDDD),
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "No run for the like, no algorithm complicated",
            style: style.copyWith(color: Colors.black87),
          ),
          Text(
            "news feeds are showed by post date time",
            style: style.copyWith(color: Colors.black87),
          ),
          Text(
            "So Enjoy and Thank You to be here ",
            style: style.copyWith(color: Colors.black87),
          ),
          NeumorphicButton(
            child: Text(
              'Start',
              style: style.copyWith(color: Colors.black, fontSize: 26),
            ),
            style: NeumorphicStyle(color: Color(0xffDDDDDD)),
            onPressed: () => Get.back(),
          )
        ],
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe(
            pages: pages,
            onPageChangeCallback: pageChangeCallback,
            waveType: WaveType.liquidReveal,
            liquidController: liquidController,
            ignoreUserGestureWhileAnimating: true,
            enableLoop: false,
            enableSlideIcon: false,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length, _buildDot),
                ),
              ],
            ),
          ),

          /* Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FlatButton(
                onPressed: () {
                  liquidController.animateToPage(
                      page: pages.length - 1, duration: 500);
                },
                child: Text("Skip to End"),
                color: Colors.white.withOpacity(0.01),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FlatButton(
                onPressed: () {
                  liquidController.jumpToPage(
                      page: liquidController.currentPage + 1);
                },
                child: Text("Next"),
                color: Colors.white.withOpacity(0.01),
              ),
            ),
          )*/
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
