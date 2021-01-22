import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:dnbapp/application/profil/profil_screen.dart';
import 'package:dnbapp/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftTab extends StatefulWidget {
  const LeftTab({Key key}) : super(key: key);

  @override
  _LeftTabState createState() => _LeftTabState();
}

class _LeftTabState extends State<LeftTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
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
        child: Expanded(
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
                        child: Text("Idea"),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text("Contact"),
                      ),
                      RaisedButton(
                        onPressed: Get.find<AuthController>().signOut,
                        child: Text("Logout"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      homePageContent: ProfilScreen(),
    );
  }
}
