import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(home: FocusWidget(),));
}
class FocusWidget extends StatefulWidget {
  const FocusWidget({super.key});

  @override
  State<FocusWidget> createState() => _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget> {
  final focus = FocusNode();
  final focusManage = FocusManager();
  
  @override
  Widget build(BuildContext context) {
    focus.addListener(() {
      if (focus.hasFocus) {
        print('hello focus');
      }
    });
    return Scaffold(
      body: Center(child: Focus(
        autofocus: true,
        focusNode: focus,
        child: Container(color: Colors.blue, height: 100, width: 100,))),
    );
  }
}