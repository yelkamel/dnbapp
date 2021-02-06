import 'package:dnbapp/animation/bullebackground.dart';
import 'package:dnbapp/application/home/layout/right_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'layout/left_tab.dart';
import 'layout/middle_tab.dart';
import 'layout/tabbar.dart';

class Home extends HookWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 3, initialIndex: 1);

    return CupertinoScaffold(
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomTabBar(controller: controller),
        extendBody: true,
        body: BulleBackground(
          maxSizeBubble: 45,
          nbOfBubble: 10,
          color: Theme.of(context).accentColor,
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(
                controller: controller,
                children: const [
                  LeftTab(),
                  MiddleTab(),
                  RightTab(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
