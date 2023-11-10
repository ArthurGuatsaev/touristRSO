import 'package:flutter/material.dart';

class WindowConstructor extends StatelessWidget {
  final Widget desktop;
  final Widget planshet;
  final Widget mobile;
  const WindowConstructor(
      {super.key,
      required this.desktop,
      required this.planshet,
      required this.mobile});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth < 500) {
        return mobile;
      } else if (constraint.maxWidth < 1200) {
        return planshet;
      } else {
        return desktop;
      }
    });
  }
}
