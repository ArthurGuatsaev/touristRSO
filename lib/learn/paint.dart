import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyPainter extends CustomPainter {
  
  const MyPainter();
  @override
  void paint(Canvas canvas, Size size) {
    // final path = Path();
    // path.moveTo(0 + 10, 0 + 10);
    // path.lineTo(size.width - 10, 10);
    // path.lineTo(size.width - 10, size.height - 10);
    // path.lineTo(10, size.height - 10);
    // path.close();
    final rect = Rect.fromCircle(center: Offset(size.width/2, size.height/2), radius: 50);
    final paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4
    ..shader = const LinearGradient(colors: [Colors.white24, Colors.black26]).createShader(rect);
    // const rect2 = Rect.fromLTWH(200, 200, 200, 200);
    // canvas.drawPath(path, paint);
    // canvas.drawOval(rect, paint);
    canvas.drawOval(rect, paint);
    // canvas.drawRect(rect, paint);
    // canvas.drawLine(const Offset(0, 0), Offset(100 - y + x, 0 - y + x), paint);
    // canvas.drawLine(Offset(100, 0), Offset(0 + 100 * y, -100 * y), paint);
    // canvas.drawLine(Offset(0, (x*30)), Offset(30 - 30 * y + (z * 30), -60 * y + (z * 30)), paint);



    // const color = Colors.blue;
    // const BlendMode blendMode = BlendMode.colorBurn;
    // canvas.drawColor(color, blendMode);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class CustomPaints extends StatefulWidget {
  const CustomPaints({super.key});

  @override
  State<CustomPaints> createState() => _CustomPaintsState();
}

class _CustomPaintsState extends State<CustomPaints> with TickerProviderStateMixin {
  late final controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final animation = Tween<double>(begin: 0, end: math.pi / 2).animate(controller);
  late final controllerX = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final animationX = Tween<double>(begin: (-math.pi * 3) / 2, end: -math.pi * 2).animate(controllerX);
  late final controllerZ = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final animationZ = Tween<double>(begin: 0.6, end: 1).animate(controllerZ);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (!animation.isCompleted) {
          controller.forward();
          controllerX.forward();
          setState(() {});
        } else {
          controller.reverse();
          controllerX.reverse();
          setState(() {});
        }
        // if(animation.isCompleted && !animationX.isCompleted) {
        //   controllerX.forward();
        //   setState(() {});
        // } 
        // if (animationX.isCompleted && !animationZ.isCompleted) {
        //   controllerZ.forward();
        //   setState(() {});
        // }
        
        },
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10)),
          child: ClipPath(
            clipper: MyClip(),
            child: Container(width: 100, height: 20, color: Colors.blue,),
              ),
        )
    ),);
  }
}


class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // final rect = Rect.fromCircle(center: Offset.zero, radius: 50);
    // final rRect = RRect.fromRectAndCorners(rect);
    final path = Path();
    path.moveTo(-10, 0);
    path.lineTo(size.width - 10, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }


}