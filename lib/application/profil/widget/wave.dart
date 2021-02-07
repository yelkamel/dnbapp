import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class ProfilWave extends StatelessWidget {
  const ProfilWave({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [Theme.of(context).primaryColor, Theme.of(context).accentColor],
            [Theme.of(context).accentColor, Theme.of(context).primaryColor],
            [Theme.of(context).primaryColor, Theme.of(context).primaryColor],
            [Theme.of(context).accentColor, Theme.of(context).primaryColor],
          ],
          durations: [35000, 19440, 10800, 6000],
          heightPercentages: [0.20, 0.23, 0.25, 0.10],
          blur: MaskFilter.blur(BlurStyle.solid, 10),
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
/*    backgroundImage: DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1600107363560-a2a891080c31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=672&q=80',
          ),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.white, BlendMode.softLight),
      ),*/
        size: Size(
          double.infinity,
          double.infinity,
        ),
      ),
    );
  }
}
