import 'package:flutter/material.dart';

class DropListExample extends StatefulWidget {
  const DropListExample({super.key});

  @override
  State<DropListExample> createState() => _DropListExampleState();
}

class _DropListExampleState extends State<DropListExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: 
      DropdownButtonFormField<int>(items: const [
        DropdownMenuItem<int>(
          value: 1,
          child: Icon(Icons.apple),),
        DropdownMenuItem<int>(
          value: 2,
          child: Icon(Icons.android),),
      ], 
      onChanged: (value) {
        print(value);
      },)
      ),
    );
  }
}