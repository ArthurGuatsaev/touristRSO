import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(home: Scaffold(body: Center (child: MapItemLabel()),),));
}
class MapItemLabel extends StatelessWidget {
  const MapItemLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: MyMapItemLabelShape(), child: ClipPath(
        clipBehavior: Clip.antiAlias,
        clipper: MyMapItemLabelPath(),
        child: Container(
          height: 170,
          width: 170,
          decoration: const BoxDecoration(
            color: Colors.red, 
          ),
      ),
    ));
  }
}
class MyMapItemLabelPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
    ..moveTo(0, 10)
    ..arcToPoint(const Offset(10, 0), radius: const Radius.circular(10))
    ..lineTo(size.width - 10, 0)
    ..arcToPoint(Offset(size.width, 10), radius: const Radius.circular(10))
    ..lineTo(size.width, size.height * 0.7 - 10)
    ..arcToPoint(Offset(size.width - 10, size.height * 0.7), radius: const Radius.circular(10))
    ..lineTo(size.width * 0.7, size.height * 0.7)
    ..lineTo(size.width/2, size.height)
    ..lineTo(size.width/3, size.height* 0.7)
    ..lineTo(10, size.height* 0.7)
    ..arcToPoint(Offset(0, size.height * 0.7 - 10), radius: const Radius.circular(10))
    ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}

class MyMapItemLabelShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
    ..moveTo(0, 10)
    ..arcToPoint(const Offset(10, 0), radius: const Radius.circular(10))
    ..lineTo(size.width - 10, 0)
    ..arcToPoint(Offset(size.width, 10), radius: const Radius.circular(10))
    ..lineTo(size.width, size.height * 0.7 - 10)
    ..arcToPoint(Offset(size.width - 10, size.height * 0.7), radius: const Radius.circular(10))
    ..lineTo(size.width * 0.7, size.height * 0.7)
    ..lineTo(size.width/2, size.height)
    ..lineTo(size.width/3, size.height* 0.7)
    ..lineTo(10, size.height* 0.7)
    ..arcToPoint(Offset(0, size.height * 0.7 - 10), radius: const Radius.circular(10))
    ..close();
    final paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5
    ..color = Colors.grey;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}