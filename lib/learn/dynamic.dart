import 'package:flutter/material.dart';
void main() {
  final x = parsing();
  print(x);
}
List<String> parsing() {
  final x = list.map((e) => e as String).toList();
  return x;
}
List<dynamic> list = ['dynamic', 'string'];
class DynamicExample extends StatefulWidget {
  const DynamicExample({super.key});

  @override
  State<DynamicExample> createState() => _DynamicExampleState();
}

class _DynamicExampleState extends State<DynamicExample> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}