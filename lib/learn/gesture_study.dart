import 'package:flutter/material.dart';

class GestureStudy extends StatefulWidget {
  const GestureStudy({super.key});

  @override
  State<GestureStudy> createState() => _GestureStudyState();
}

class _GestureStudyState extends State<GestureStudy> with TickerProviderStateMixin {
  late final controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  Offset offsetStart = Offset.zero;
  Offset offsetEnd = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('hello world', style: TextStyle(fontFamily: 'monospace')),)
    );
  }
}