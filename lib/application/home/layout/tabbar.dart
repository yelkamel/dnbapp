import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dnbapp/application/common/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomTabBar extends HookWidget {
  final TabController controller;

  const BottomTabBar({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 20,
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: SafeArea(
        child: TabBar(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          indicatorColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Theme.of(context).primaryColor.withOpacity(0.6),
          indicator: BoxDecoration(
            color: Theme.of(context).accentColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).accentColor.withOpacity(0.3),
                blurRadius: 25,
                offset: Offset(0, 20), // changes position of shadow
              ),
            ],
          ),
          tabs: [
            Tab(
              child: Icon(Icons.person),
            ),
            Tab(
              child: Icon(Icons.map),
            ),
            Tab(
              child: Icon(Icons.topic),
            ),
          ],
        ),
      ),
    );
  }
}
