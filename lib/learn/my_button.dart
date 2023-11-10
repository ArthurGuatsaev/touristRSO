import 'package:flutter/material.dart';
import 'dart:ui';
class MyBorder extends OutlinedBorder {
  final Gradient gradient;
  final double borderWidth;
  final double below = 8;
  const MyBorder({required this.gradient, required this.borderWidth}) : super();

  @override
  OutlinedBorder copyWith({BorderSide? side, Gradient? gradient, double? borderWidth}) {
      return MyBorder(gradient: gradient ?? this.gradient, borderWidth: borderWidth?? this.borderWidth);
  }
  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is MyBorder) {
      return MyBorder(gradient: Gradient.lerp(a.gradient, gradient, t)!, borderWidth: lerpDouble(a.borderWidth, borderWidth, t)!);
    }
    return super.lerpFrom(a, t);
  }
  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is MyBorder) {
      return MyBorder(gradient: Gradient.lerp(gradient, b.gradient, t)!, borderWidth: lerpDouble(borderWidth, b.borderWidth, t)!);
    }
    return super.lerpTo(b, t);
  }
  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // double halfWidth = rect.size.width / 2;

    final path = Path();
    path.addArc(rect, 0, 6);
    // path.moveTo(rect.left, rect.top);
    // path.lineTo(rect.left + rect.size.width / 2, rect.top + rect.size.height / 2);
    // path.lineTo(rect.right, rect.top);
    // path.lineTo(rect.right, rect.bottom);
    // path.lineTo(rect.left, rect.bottom);
    // path.close();
    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getInnerPath(rect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final shader = gradient.createShader(rect);
    final paint = Paint()
    ..shader = shader
    ..style = PaintingStyle.stroke
    ..strokeWidth = borderWidth;
    //final path = getInnerPath(rect, textDirection: textDirection);
    canvas.drawCircle(Offset(rect.width/2, rect.height/2), rect.width/2, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return MyBorder(gradient: gradient.scale(t), borderWidth: borderWidth * t);
  }
  @override
  bool operator ==(Object other) {
    return other.runtimeType == runtimeType && other is MyBorder && other.borderWidth == borderWidth && other.gradient == gradient;
  }
  @override
  int get hashCode => Object.hash(side, borderWidth, gradient);

}

class MyCustomButton extends StatefulWidget {
  const MyCustomButton({super.key});

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> with TickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    super.initState();
  }
  double width = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AnimatedBuilder(
        animation: animation,
        builder: (context, widget) {
          return ElevatedButton(
            onPressed: () {
              setState(() {
                
                if (animationController.isCompleted) {
                  animationController.reverse();
                } else {
                  animationController.forward();
                }
              });
            }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.pressed)) {
                  // return Colors.red;
                }
                return Colors.amber;
              }),
              // fixedSize: MaterialStateProperty.all(Size(width - width/2 * animation.value, 100)),
              fixedSize: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return const Size(195,195);
                }
                return const Size(200,200);
              }),
              shape: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return const MyBorder(gradient: LinearGradient(colors: [Colors.red, Colors.red]), borderWidth: 8);
                }
                if (states.contains(MaterialState.selected)) {
                  return const MyBorder(gradient: LinearGradient(colors: [Colors.green, Colors.green]), borderWidth: 8);
                }
                if (states.contains(MaterialState.focused)) {
                  return const MyBorder(gradient: LinearGradient(colors: [Colors.blue, Colors.blue]), borderWidth: 8);
                }
                return const MyBorder(gradient: LinearGradient(colors: [Colors.green, Colors.yellow, Colors.red]), borderWidth: 4);
                  },
                ),
              ),
            child: const Text('hello world'), 
          );
        }
      )),
    );
  }
}

