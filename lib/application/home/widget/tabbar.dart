import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomTabBar extends HookWidget {
  final TabController controller;

  const BottomTabBar({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(1);

    return ConvexAppBar(
      items: [
        TabItem(title: 'Profil', icon: Icons.person),
        TabItem(title: 'World', icon: Icons.map),
        TabItem(title: 'Feeds', icon: Icons.topic)
      ],
      style: TabStyle.reactCircle,
      controller: controller,
      onTap: (index) {
        controller.animateTo(index);
        currentIndex.value = index;
      },
    );
  }
}
