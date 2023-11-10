import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as vect;
class CustomAnimation extends StatefulWidget {
  const CustomAnimation({super.key});

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Transform(
        transform: Matrix4.compose(vect.Vector3(0, 0, 10), vect.Quaternion.fromRotation(vect.Matrix3.rotationY(math.pi/2)), vect.Vector3.all(2)),
        child: CustomPaint(painter: CustomPaintAnimation(),)),)
    );
  }
}


class CustomPaintAnimation extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10
    ..strokeJoin = StrokeJoin.round;
    canvas.drawCircle(Offset.zero, 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}