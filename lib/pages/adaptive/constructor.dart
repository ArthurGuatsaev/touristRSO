import 'package:flutter/material.dart';

class WindowConstructor extends StatelessWidget {
  final Widget full;
  final Widget little;
  final Widget mobile;
  const WindowConstructor(
      {super.key, required this.full, required this.little, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth > 900) {
        return full;
      } else if (constraint.maxWidth > 500) {
        return little;
      } else {
        return mobile;
      }
    });
  }
}
