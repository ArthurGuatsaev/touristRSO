import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ScrollWidget(),));
}

class AnimationDrive extends StatefulWidget {
  final ValueListenable<double> scroolPosition;
  const AnimationDrive({super.key, required this.scroolPosition});

  @override
  State<AnimationDrive> createState() => _AnimationDriveState();
}

class _AnimationDriveState extends State<AnimationDrive> {
  @override
  Widget build(BuildContext context) {
    return 
        FadeTransition(
        opacity: Animation<double>.fromValueListenable(widget.scroolPosition, transformer: (double value) {
         return (value / 1000).clamp(0, 1);
       },),
       child: Container(
        height: 100, width: 100,
         color: Colors.red,
       ),
     );
  }
}


class ScrollWidget extends StatefulWidget {
  const ScrollWidget({super.key});

  @override
  State<ScrollWidget> createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemBuilder: (context, index) {
                final x = controller.offset;
              return SizedBox(width: 100, height: 100, child: SizedBox(height: 100, width: 100, child: AnimationDrive(scroolPosition: ValueNotifier<double>(x))),);
            }),
          ),
        ],
      )
    );
  }
}