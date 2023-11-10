import 'package:flutter/material.dart';
class TransformLearn extends StatelessWidget {
  const TransformLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform(
          transform: Matrix4.rotationX(3) .. rotateX(34)..rotateY(54),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}