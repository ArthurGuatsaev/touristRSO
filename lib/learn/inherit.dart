import 'package:flutter/material.dart';

class MyInherit extends InheritedWidget {
  final Color color;
  final Widget child;
  const MyInherit({super.key, required this.color, required this.child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget is MyInherit && oldWidget.color == color;
  }
  static MyInherit? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInherit>();
  }
  static MyInherit of(BuildContext context) {
    final depend = maybeOf(context);
    return depend ?? MyInherit(color: Colors.black, child: Container(color: Colors.amber));
  }
}