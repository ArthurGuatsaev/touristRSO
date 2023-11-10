import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double vl = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100, width: 300, color: Colors.red,
          child: Slider.adaptive(value: vl,
          min: 0.0,
          max: 100,
          onChanged: (value) { 
            print(value);
            vl = value;
            setState(() {
              
            });
            }),
        )
      )
    );
  }
}