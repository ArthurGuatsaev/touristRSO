import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_webapp/learn/inherit.dart';

class MyShapeDecoration extends OutlinedBorder {
  final Gradient borderGradient;
  final double borderWidth;
  final double bevel = 8.0;
  const MyShapeDecoration(
      {required this.borderGradient, required this.borderWidth})
      : super();
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.symmetric(
      vertical: borderWidth, horizontal: bevel / 2 + borderWidth);
  @override
  OutlinedBorder copyWith(
      {BorderSide? side,
      double? borderWidth,
      double? bevel,
      Gradient? borderGradient}) {
    return MyShapeDecoration(
        borderGradient: borderGradient ?? this.borderGradient,
        borderWidth: borderWidth ?? this.borderWidth);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    path.moveTo(rect.left + bevel, rect.top);
    path.lineTo(rect.right, rect.top);
    path.lineTo(rect.right - bevel, rect.bottom);
    path.lineTo(rect.left, rect.bottom);
    path.close();
    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getInnerPath(rect, textDirection: textDirection);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is MyShapeDecoration &&
        other.side == side &&
        other.borderWidth == borderWidth &&
        other.borderGradient == borderGradient;
  }

  @override
  int get hashCode => Object.hash(side, borderWidth, borderGradient);
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final shader = borderGradient.createShader(rect);
    final paint = Paint()
      ..shader = shader
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;
    final innerPath = getInnerPath(rect, textDirection: textDirection);
    canvas.drawPath(innerPath, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return MyShapeDecoration(
        borderGradient: borderGradient.scale(t), borderWidth: borderWidth * t);
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is MyShapeDecoration) {
      return MyShapeDecoration(
          borderGradient: Gradient.lerp(a.borderGradient, borderGradient, t)!,
          borderWidth: lerpDouble(a.borderWidth, borderWidth, t)!);
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is MyShapeDecoration) {
      return MyShapeDecoration(
          borderGradient: Gradient.lerp(borderGradient, b.borderGradient, t)!,
          borderWidth: lerpDouble(borderWidth, b.borderWidth, t)!);
    }
    return super.lerpTo(b, t);
  }
}

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyInherit(
        color: Colors.yellow,
        child: Center(
            child: Column(
          children: [
            Builder(builder: (context) {
              // final color = context.findAncestorWidgetOfExactType<MyInherit>()?.color;
              // context.dependOnInheritedWidgetOfExactType<MyInherit>()!;

              return Icon(
                Icons.home,
                color:
                    context.findAncestorWidgetOfExactType<MyInherit>()?.color ??
                        Colors.black12,
              );
            }),
            ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 16)),
                    tapTargetSize: MaterialTapTargetSize.padded,
                    fixedSize:
                        MaterialStateProperty.resolveWith<Size>((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const Size(50, 20);
                      }
                      return const Size(20, 10);
                    }),
                    shape: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const MyShapeDecoration(
                            borderGradient: LinearGradient(
                                colors: [Colors.red, Colors.red]),
                            borderWidth: 6);
                      }
                      if (states.contains(MaterialState.selected)) {
                        return const MyShapeDecoration(
                            borderGradient: LinearGradient(
                                colors: [Colors.blue, Colors.grey]),
                            borderWidth: 6);
                      }
                      return const MyShapeDecoration(
                          borderGradient: LinearGradient(
                              colors: [Colors.purple, Colors.green]),
                          borderWidth: 2);
                    })),
                onPressed: () {},
                child: const Text('hello')),
          ],
        )),
      ),
    );
  }
}
