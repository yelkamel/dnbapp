import 'package:flutter/material.dart';

class SpreadShadowContainer extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final double spread;

  SpreadShadowContainer(
      {Key key, this.child, this.backgroundColor, this.spread = 15.0})
      : super(key: key);

  @override
  _SpreadShadowContainerState createState() => _SpreadShadowContainerState();
}

class _SpreadShadowContainerState extends State<SpreadShadowContainer>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animationController.repeat(reverse: true);
    _animation =
        Tween(begin: 0.0, end: widget.spread).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).accentColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).accentColor,
            blurRadius: _animation.value,
            spreadRadius: _animation.value,
          )
        ],
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.backgroundColor,
          ),
          child: widget.child),
    );
  }
}
