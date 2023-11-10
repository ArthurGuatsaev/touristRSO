import 'package:flutter/material.dart';

class MultiLayoutCustomPhone extends StatefulWidget {
  const MultiLayoutCustomPhone({super.key});

  @override
  State<MultiLayoutCustomPhone> createState() => _MultiLayoutCustomPhoneState();
}

class _MultiLayoutCustomPhoneState extends State<MultiLayoutCustomPhone> with TickerProviderStateMixin {
  late final AnimationController  controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
  late final Animation animation = Tween<double>(begin: 1, end: 2).animate(controller);
  
  @override
  Widget build(BuildContext context) {
    return 
      AnimatedBuilder(
        animation: animation,
        builder: (context, child) => CustomMultiChildLayout(delegate: _MyMultiChildLayoutDelegate(scale: animation.value),
            children: [
              for (var i = 1; i < 10; i ++)
              LayoutId(
                id: i,
                child: Builder(
                  builder: (context) {
                    return GestureDetector(
                      // onTap: () => Navigator.of(context).pushNamed('/article'),
                      onLongPressStart: (details) {
                        
                        controller.forward();
                        overlay(context:context, color: i.color, alignment: i.alignment, scale: i.scale);
                      
                      }, // переход пропишу вместе с фотографией
                      
                      onLongPressEnd: (details) {
                        
                        controller.reverse().whenComplete(() => overlayEntry!.remove());
                        
                      },
                      child: Container(
                        color: i.color),
                    );
                  }
                )),
              
                ],
          ),
        );
  }
  OverlayEntry? overlayEntry;
  void overlay({required BuildContext context, required Color color, required Alignment alignment, required double scale}) {
    // final render = multyKey.currentContext!.findRenderObject() as RenderBox;
    final renderFromContext = context.findRenderObject() as RenderBox;
    final offset = renderFromContext.localToGlobal(Offset.zero);
    final overlay = Overlay.of(context);
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: offset.dy,
        left: offset.dx,
        child: ScaleTransition(
          alignment: alignment,
          scale: Tween<double>(begin: 1, end: scale).animate(controller),
          child: Container(
            color: color,
            height: renderFromContext.size.height,
            width: renderFromContext.size.width,
          ),
        ));
    });
    overlay.insert(overlayEntry!);
  }
}

class _MyMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  final double scale;
  _MyMultiChildLayoutDelegate({required this.scale});
  @override
  void performLayout(Size size) {
      if (size.width < 1200) {
        layoutChild(1, BoxConstraints.expand(height: size.height * 0.5 * scale, width: size.width * 0.6));
        positionChild(1, const Offset(0, 0));
        
        layoutChild(2, BoxConstraints.expand(height: size.height * 0.3,width: size.width * 0.4));
        positionChild(2, Offset(size.width * 0.6, 0));
        
        layoutChild(3, BoxConstraints.expand(height: size.height * 0.17,width: size.width * 0.4));
        positionChild(3, Offset(size.width * 0.6, size.height * 0.3));

        layoutChild(4, BoxConstraints.expand(height: size.height * 0.17,width: size.width * 0.4));
        positionChild(4, Offset(size.width * 0.6, size.height * 0.47));
        
        layoutChild(9, BoxConstraints.expand(height: size.height * 0.22,width: size.width * 0.5));
        positionChild(9, Offset(size.width * 0.5, size.height * 0.78));
        
        layoutChild(6, BoxConstraints.expand(height: size.height * 0.22,width: size.width * 0.5));
        positionChild(6, Offset(size.width * 0.0, size.height * 0.78));
        
        layoutChild(5, BoxConstraints.expand(height: size.height * 0.14,width: size.width * 0.6));
        positionChild(5, Offset(size.width * 0, size.height * 0.50));
        
        layoutChild(7, BoxConstraints.expand(height: size.height * 0.14,width: size.width * 0.4));
        positionChild(7, Offset(size.width * 0, size.height * 0.64));
        
        layoutChild(8, BoxConstraints.expand(height: size.height * 0.14,width: size.width * 0.6));
        positionChild(8, Offset(size.width * 0.4, size.height * 0.64));
      } else {
        layoutChild(1, BoxConstraints.expand(height: size.height * 0.7, width: size.width * 0.35));
        positionChild(1, const Offset(0, 0));
        
        layoutChild(2, BoxConstraints.expand(height: size.height * 0.5,width: size.width * 0.25));
        positionChild(2, Offset(size.width * 0.35, 0));
        
        layoutChild(3, BoxConstraints.expand(height: size.height * 0.3,width: size.width * 0.2));
        positionChild(3, Offset(size.width * 0.6, 0));

        layoutChild(4, BoxConstraints.expand(height: size.height * 0.3,width: size.width * 0.2));
        positionChild(4, Offset(size.width * 0.8, 0));
        
        layoutChild(9, BoxConstraints.expand(height: size.height * 0.3,width: size.width * 0.35));
        positionChild(9, Offset(size.width * 0.35, size.height * 0.7));
        
        layoutChild(5, BoxConstraints.expand(height: size.height * 0.3,width: size.width * 0.35));
        positionChild(5, Offset(size.width * 0.7, size.height * 0.7));
        
        layoutChild(6, BoxConstraints.expand(height: size.height * 0.3,width: size.width * 0.35));
        positionChild(6, Offset(0, size.height * 0.7));

        layoutChild(7, BoxConstraints.expand(height: size.height * 0.2,width: size.width * 0.25));
        positionChild(7, Offset(size.width * 0.35, size.height * 0.5));
        
        layoutChild(8, BoxConstraints.expand(height: size.height * 0.4,width: size.width * 0.5));
        positionChild(8, Offset(size.width * 0.6, size.height * 0.3));
      }
      
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
  
}


GlobalKey multyKey = GlobalKey();
extension on int {
  double get scale {
    switch (this) {
      case 1: return 1;
      case 2: return 2;
      case 3: return 2;
      case 4: return 2;
      case 5: return 1.5;
      case 6: return 2;
      case 7: return 2.3;
      case 8: return 1.5;
      case 9: return 2;
      default: return 1;
    }
  }
  Alignment get alignment {
    switch (this) {
      case 1: return Alignment.topLeft;
      case 2: return Alignment.topRight;
      case 3: return Alignment.topRight;
      case 4: return Alignment.centerRight;
      case 5: return Alignment.bottomLeft;
      case 6: return Alignment.bottomLeft;
      case 7: return Alignment.centerLeft;
      case 8: return Alignment.centerRight;
      case 9: return Alignment.bottomRight;
      default: return Alignment.bottomCenter;
    }
  }
  Color get color {
    switch (this) {
      case 1: return Colors.red;
      case 2: return Colors.yellow;
      case 3: return Colors.black;
      case 4: return Colors.green;
      case 5: return Colors.blue;
      case 6: return Colors.brown;
      case 7: return Colors.purple;
      case 8: return Colors.amber;
      case 9: return Colors.pink;
      default: return Colors.teal;
    }
  }
}
