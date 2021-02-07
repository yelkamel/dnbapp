import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:dnbapp/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerMenu extends StatelessWidget {
  final Widget child;
  const DrawerMenu({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedDrawer(
      shadowColor: Theme.of(context).primaryColor,
      backgroundGradient: LinearGradient(
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).accentColor,
        ],
      ),
      closeIcon: Icon(Icons.arrow_back,
          color: Theme.of(context).textTheme.bodyText1.color),
      openIcon: Icon(Icons.help_center,
          color: Theme.of(context).textTheme.bodyText1.color),
      menuPageContent: Padding(
        padding: const EdgeInsets.only(right: 150.0, bottom: 30),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Idea",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Contact",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    RaisedButton(
                      onPressed: Get.find<AuthController>().signOut,
                      child: Text(
                        "Logout",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      homePageContent: child,
    );
  }
}
