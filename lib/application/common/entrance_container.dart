import 'package:flutter/material.dart';

class EntranceContainer extends StatefulWidget {
  /// Child to be animated on entrance
  final Widget child;

  /// Delay after which the animation will start
  final Duration delay;

  /// Duration of entrance animation
  final Duration duration;

  /// Starting point from which the widget will fade to its default position
  final Offset offset;

  const EntranceContainer({
    Key key,
    this.child,
    this.delay = const Duration(),
    this.duration = const Duration(milliseconds: 400),
    this.offset = const Offset(0.0, 32.0),
  }) : super(key: key);

  @override
  EntranceContainerState createState() {
    return EntranceContainerState();
  }
}

class EntranceContainerState extends State<EntranceContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _dxAnimation;
  Animation _dyAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _dxAnimation =
        Tween(begin: widget.offset.dx, end: 0.0).animate(_controller);
    _dyAnimation =
        Tween(begin: widget.offset.dy, end: 0.0).animate(_controller);
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Opacity(
        opacity: _controller.value,
        child: Transform.translate(
          offset: Offset(
              _dxAnimation.value as double, _dyAnimation.value as double),
          child: widget.child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
