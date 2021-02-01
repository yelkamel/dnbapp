import 'package:dnbapp/application/container/dnb_selected.dart';
import 'package:dnbapp/crossapp/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../post_state.dart';

List<String> typeStr = [
  "full onbeat",
  "beautfilly spot",
  "new step",
  "I don't know"
];

class PostTypeStep extends HookWidget {
  final PostState state;
  const PostTypeStep({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
        child: FractionallySizedBox(
          heightFactor: 0.75,
          child: GlassContainer(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "Select the words that describe the most your video",
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                ),
                for (final typeStr in typeStr)
                  DnbSelectedContainer(
                    selected: state.type.value == typeStr,
                    child: RawMaterialButton(
                      constraints: BoxConstraints(minHeight: 60, minWidth: 200),
                      onPressed: () {
                        state.type.value = typeStr;
                        state.hideNext.value = false;
                      },
                      child: Text(typeStr,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}

/*

 CircularMenu(
                // menu alignment
                alignment: Alignment.center,
                // menu radius
                radius: 100,
                // widget in the background holds actual page content
                // backgroundWidget: MyCustomWidget(),
                // global key to control the animation anywhere in the code.
                key: GlobalKey<CircularMenuState>(),
                // animation duration
                animationDuration: Duration(milliseconds: 500),
                // animation curve in forward
                curve: Curves.bounceOut,
                // animation curve in reverse
                reverseCurve: Curves.fastOutSlowIn,
                // first item angle
                startingAngleInRadian: 0,
                // last item angle
                endingAngleInRadian: pi * 2,
                // toggle button callback
                toggleButtonOnPressed: () {
                  //callback
                },
                // toggle button appearance properties
                toggleButtonColor: Colors.pink,
                toggleButtonBoxShadow: [
                  BoxShadow(
                    color: Theme.of(context).backgroundColor,
                    blurRadius: 10,
                  ),
                ],
                toggleButtonIconColor: Colors.white,
                toggleButtonMargin: 10.0,
                toggleButtonPadding: 10.0,
                toggleButtonSize: 40.0,
                items: [
                  CircularMenuItem(
                    onTap: () {},
                    icon: Icons.home,
                  ),
                  CircularMenuItem(
                      icon: Icons.search,
                      onTap: () {
                        //callback
                      }),
                  CircularMenuItem(
                      icon: Icons.settings,
                      onTap: () {
                        //callback
                      }),
                  CircularMenuItem(
                      icon: Icons.star,
                      onTap: () {
                        //callback
                      }),
                  CircularMenuItem(
                      icon: Icons.pages,
                      onTap: () {
                        //callback
                      }),
                ]),

*/
