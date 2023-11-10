import 'package:flutter/material.dart';

class TweenAnimationCustom extends StatefulWidget {
  const TweenAnimationCustom({super.key});

  @override
  State<TweenAnimationCustom> createState() => _TweenAnimationCustomState();
}

class _TweenAnimationCustomState extends State<TweenAnimationCustom> {
  final List<Widget> widgets = [Container(width: 100, height: 100, color: Colors.grey), Container(width: 100, height: 200, color: Colors.red),];
  bool tup = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          tup = !tup;
          });
      },),
      body: Center(child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 2500),
        builder: (context, value, child) {
          return tup ? Container(
            height: 100 * value,
            width: 100 * value,
            color: Colors.blueAccent,
          ) : widgets[1];
        },
        child: Container(width: 200, height: 200, color: Colors.red)
      )),
    );
  }
}

class CustomFloatingActionButtonAnimator extends FloatingActionButtonAnimator {
  @override
  Offset getOffset({required Offset begin, required Offset end, required double progress}) {
    // TODO: implement getOffset
    throw UnimplementedError();
  }

  @override
  Animation<double> getRotationAnimation({required Animation<double> parent}) {
    // TODO: implement getRotationAnimation
    throw UnimplementedError();
  }

  @override
  Animation<double> getScaleAnimation({required Animation<double> parent}) {
    // TODO: implement getScaleAnimation
    throw UnimplementedError();
  }

}