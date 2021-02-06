import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flashy_tab_bar/flashy_tab_bar.dart';

class BottomTabBar extends HookWidget {
  final TabController controller;

  const BottomTabBar({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(1);

    return Container(
      decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).accentColor,

        border: Border(
          top: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
      ),
      child: SafeArea(
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Theme.of(context).primaryColor.withOpacity(0.6),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
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
