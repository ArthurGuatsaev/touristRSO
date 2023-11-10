import 'package:flutter/material.dart';

class MultiLayoutCustomDesctop extends StatefulWidget {
  const MultiLayoutCustomDesctop({super.key});

  @override
  State<MultiLayoutCustomDesctop> createState() => _MultiLayoutCustomDesctopState();
}

class _MultiLayoutCustomDesctopState extends State<MultiLayoutCustomDesctop> with TickerProviderStateMixin {
  late final controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AnimatedBuilder(
        animation: Tween<double>(begin: 0, end: 1.0).animate(controller),
        builder: (context, child) =>  CustomMultiChildLayout(delegate: _MyMultiChildLayoutDelegate(),
              children: [LayoutId(
                id: 1,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/article'),
                  child: Container(
                    color: Colors.red),
                )),
              LayoutId(
                id: 2,
                child: Container(color: Colors.yellow)),
              LayoutId(
                id: 3,
                child: Container(color: Colors.blue)),
              LayoutId(
                id: 4,
                child: Container(color: Colors.green)),
              LayoutId(
                id: 6,
                child: Container(color: Colors.grey)),
              LayoutId(
                id: 5,
                child: Container(color: Colors.brown)),
              LayoutId(
                id: 7,
                child: Container(color: Colors.pink)),
              LayoutId(
                id: 8,
                child: Container(color: Colors.orange)),
              LayoutId(
                id: 9,
                child: Container(color: Colors.purple)),
                ]            ,
            ),
      ),
        )
    );
  }
}

class _MyMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
      
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
      
      layoutChild(6, BoxConstraints.expand(height: size.height * 0.3,width: size.width * 0.35));
      positionChild(6, Offset(size.width * 0.7, size.height * 0.7));
      
      layoutChild(5, BoxConstraints.expand(height: size.height * 0.3,width: size.width * 0.35));
      positionChild(5, Offset(0, size.height * 0.7));

      layoutChild(7, BoxConstraints.expand(height: size.height * 0.2,width: size.width * 0.25));
      positionChild(7, Offset(size.width * 0.35, size.height * 0.5));
      
      layoutChild(8, BoxConstraints.expand(height: size.height * 0.4,width: size.width * 0.5));
      positionChild(8, Offset(size.width * 0.6, size.height * 0.3));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return true;
  }

}
