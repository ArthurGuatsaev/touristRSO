import 'package:flutter/material.dart';
void main() {
  runApp(const ShapeExample());
}
class ShapeExample extends StatelessWidget {
  const ShapeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child:ElevatedButton(
          style: ElevatedButton.styleFrom(
            splashFactory: InkSplash.splashFactory
          ),
          onPressed: (){},
          child: Icon(Icons.home)
        ),),
      ),
    );
  }
}

class MyMaterialInkController extends MaterialInkController{
  @override
  void addInkFeature(InkFeature feature) {
    // TODO: implement addInkFeature
  }

  @override
  // TODO: implement color
  Color? get color => throw UnimplementedError();

  @override
  void markNeedsPaint() {
    // TODO: implement markNeedsPaint
  }

  @override
  // TODO: implement vsync
  TickerProvider get vsync => throw UnimplementedError();

}
class MyInteractiveInkFeatureFactory extends InteractiveInkFeatureFactory {
  
  @override
  InteractiveInkFeature create({required MaterialInkController controller, required RenderBox referenceBox, required Offset position, required Color color, required TextDirection textDirection, bool containedInkWell = false, RectCallback? rectCallback, BorderRadius? borderRadius, ShapeBorder? customBorder, double? radius, VoidCallback? onRemoved}) {
    return MyInteractiveInk(color: Colors.black, controller: controller, referenceBox: referenceBox);
}
}

class MyInteractiveInk extends InteractiveInkFeature {
  MyInteractiveInk({required super.controller, required super.referenceBox, required super.color});
  
  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {
    final Offset? originOffset = MatrixUtils.getAsTranslation(transform);
    canvas.save();
    if (originOffset == null) {
      canvas.transform(transform.storage);
    } else {
      canvas.translate(originOffset.dx, originOffset.dy);
    }
    final paint = Paint()..color = Colors.green..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset.zero, 15, paint);
    canvas.restore();
  }

}