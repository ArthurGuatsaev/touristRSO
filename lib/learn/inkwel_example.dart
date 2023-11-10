import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: _InkwelExample(),
  ));
}

class _InkwelExample extends StatefulWidget {
  const _InkwelExample({super.key});

  @override
  State<_InkwelExample> createState() => __InkwelExampleState();
}

class __InkwelExampleState extends State<_InkwelExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () {},
        child: Ink(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
      )),
    );
  }
}
