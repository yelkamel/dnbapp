import 'package:dnbapp/application/profil/profil_state.dart';
import 'package:flutter/material.dart';

class ProfilInfoList extends StatelessWidget {
  final ProfilState state;
  const ProfilInfoList(this.state, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nb of post: 3'),
        ],
      ),
    );
  }
}
