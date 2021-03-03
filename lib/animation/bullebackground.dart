import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart';
import 'package:flutter/material.dart';

class BulleBackground extends StatefulWidget {
  final Widget child;
  final Color color;
  final double maxSizeBubble;
  final int nbOfBubble;
  const BulleBackground(
      {Key key, this.child, this.color, this.maxSizeBubble, this.nbOfBubble})
      : super(key: key);

  @override
  _BulleBackgroundState createState() => _BulleBackgroundState();
}

class _BulleBackgroundState extends State<BulleBackground>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(
        options: ParticleOptions(
          baseColor: Theme.of(context).accentColor,
          spawnOpacity: 0.0,
          opacityChangeRate: 0.25,
          minOpacity: 0.3,
          maxOpacity: 0.8,
          spawnMinSpeed: 60.0,
          spawnMaxSpeed: 90.0,
          spawnMinRadius: widget.maxSizeBubble / 2,
          spawnMaxRadius: widget.maxSizeBubble,
          particleCount: widget.nbOfBubble,
        ),
      ),
      vsync: this,
      child: widget.child,
    );
  }
}

class BulleBackgroundTT extends StatefulWidget {
  final Widget child;
  final Color color;
  final double maxSizeBubble;
  final int nbOfBubble;

  const BulleBackgroundTT({
    Key key,
    @required this.child,
    this.color,
    this.maxSizeBubble = 30,
    this.nbOfBubble = 10,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BulleBackgroundTTState();
  }
}

class _BulleBackgroundTTState extends State<BulleBackgroundTT>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Bubble> bubbles;

  @override
  void initState() {
    super.initState();

    // Initialize bubbles
    bubbles = List();
    for (int i = 0; i < widget.nbOfBubble; i++) {
      bubbles.add(Bubble(widget.color, widget.maxSizeBubble));
    }

    // Init animation controller
    _controller = new AnimationController(
        duration: const Duration(seconds: 1000), vsync: this);
    _controller.addListener(() {
      updateBubblePosition();
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: CustomPaint(
            foregroundPainter:
                BubblePainter(bubbles: bubbles, controller: _controller),
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
          ),
        ),
        Center(
          child: widget.child,
        )
      ],
    );
  }

  void updateBubblePosition() {
    bubbles.forEach((it) {
      if (it != null) it.updatePosition();
    });
    setState(() {});
  }
}

class BubblePainter extends CustomPainter {
  final List<Bubble> bubbles;
  final AnimationController controller;

  BubblePainter({this.bubbles, this.controller});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    bubbles.forEach((it) => it.draw(canvas, canvasSize));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Bubble {
  Color colour;
  double direction;
  double speed;
  double radius;
  double x;
  double y;

  Bubble(Color colour, double maxBubbleSize) {
    this.colour = colour.withOpacity(Random().nextDouble());
    this.direction = Random().nextDouble() * 360;
    this.speed = 1;
    this.radius = Random().nextDouble() * maxBubbleSize;
  }

  draw(Canvas canvas, Size canvasSize) {
    Paint paint = new Paint()
      ..color = colour
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    assignRandomPositionIfUninitialized(canvasSize);

    randomlyChangeDirectionIfEdgeReached(canvasSize);

    canvas.drawCircle(Offset(x, y), radius, paint);
  }

  void assignRandomPositionIfUninitialized(Size canvasSize) {
    if (x == null) {
      this.x = Random().nextDouble() * canvasSize.width;
    }

    if (y == null) {
      this.y = Random().nextDouble() * canvasSize.height;
    }
  }

  updatePosition() {
    var a = 180 - (direction + 90);
    direction > 0 && direction < 180
        ? x += speed * sin(direction) / sin(speed)
        : x -= speed * sin(direction) / sin(speed);
    direction > 90 && direction < 270
        ? y += speed * sin(a) / sin(speed)
        : y -= speed * sin(a) / sin(speed);
  }

  randomlyChangeDirectionIfEdgeReached(Size canvasSize) {
    if (x > canvasSize.width || x < 0 || y > canvasSize.height || y < 0) {
      direction = Random().nextDouble() * 360;
    }
  }
}
