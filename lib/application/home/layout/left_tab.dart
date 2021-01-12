import 'package:dnbapp/application/profil/profil_screen.dart';
import 'package:flutter/material.dart';

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
    return ProfilScreen();
  }
}
