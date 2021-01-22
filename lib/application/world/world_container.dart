import 'package:flutter/material.dart';

class WorldContainer extends StatefulWidget {
  final Widget child;
  final double width;
  final double height;

  WorldContainer({
    Key key,
    this.child,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  _WorldContainerState createState() => _WorldContainerState();
}

class _WorldContainerState extends State<WorldContainer>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 15.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
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
      child: widget.child,
    );
  }
}
