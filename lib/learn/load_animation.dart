import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;
class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> with TickerProviderStateMixin {
  
  double x = 0;
  final StreamController<double> _controller = StreamController.broadcast();
  void add() async {
    _controller.add(0.3);
    await Future.delayed(const Duration(seconds: 1));
    _controller.add(0.4);
    await Future.delayed(const Duration(seconds: 5));
    _controller.add(0.6);
    await Future.delayed(const Duration(milliseconds: 100));
    _controller.add(0.8);
    _controller.add(1);
  }
  double oldValue = 0;
  @override
  void initState() {
    _controller.stream.listen((event) {
      oldValue = x;
      x = event;
      setState(() { 
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        add();
      },),
      body: NewWidget(xx: x, key: ValueKey(x), oldValue: oldValue)
    );
  }
}

class NewWidget extends StatefulWidget {
  final double xx;
  final double oldValue;
  const NewWidget({
    super.key,
    required this.xx,
    required this.oldValue
  });

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController.forward();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();

  }
  late final AnimationController animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final Animation animation = Tween<double>(begin: widget.oldValue, end: widget.xx).animate(animationController);
  @override
  Widget build(BuildContext context) {
    return Center(child:  AnimatedBuilder(
      animation: animation,
      builder: (context, widget) {
        return CustomPaint(painter: MyLoadAnimation(x: animation.value),);
      }
    )
     );
  }
}

class MyLoadAnimation extends CustomPainter {
  final double x;
  MyLoadAnimation({required this.x});
  @override
  void paint(Canvas canvas, Size size) {
    final  y = 1 - x;
    final paintAdd = Paint()
    ..color = Colors.red
    ..strokeWidth = 8
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;
    final paintEmpty = Paint()
    ..color = Colors.blue
    ..strokeWidth = 8
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;
    final rect = Rect.fromCenter(center: Offset.zero, width: 100, height: 100);
    final pathAdd = Path();
    final pathEmpty = Path();
    pathAdd.arcTo(rect, -math.pi /2, (math.pi * 1.999)* x, true);
    pathEmpty.arcTo(rect, -math.pi/2, (-math.pi * 1.999) * y, true);
    canvas.drawPath(pathAdd, paintAdd);
    canvas.drawPath(pathEmpty, paintEmpty);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

void main() {
  runApp(const MaterialApp(home: LoadingAnimation(),));
}