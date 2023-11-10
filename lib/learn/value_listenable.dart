import 'dart:math';

import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(home: ValueListen(),));
}
class ValueListen extends StatefulWidget {
  const ValueListen({super.key});

  @override
  State<ValueListen> createState() => _ValueListenState();
}

class _ValueListenState extends State<ValueListen> {
 final value = ValueNotifier(0);
 void add() {
  value.value += 1;
 }
  @override
  Widget build(BuildContext context) {
    return MyInherit(
      model: CartModel(),
      child: Builder(
          builder: (context) {
          final x = context.dependOnInheritedWidgetOfExactType<MyInherit>()!.model;
            return Scaffold(
              floatingActionButton: FloatingActionButton(onPressed: () => x.addItem('item'),),
              body: Builder(
                builder: (context) {
                  return Column(children: [
                  for (var i = 0; i < x.count; i ++) Icon(Icons.add, color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1),)
                  ]);
                }
              ),);
          }
        ),
    );
  }
}


class MyInherit extends InheritedNotifier {
  final CartModel model;
  const MyInherit({required this.model, required super.child, super.key}) : super( notifier: model);
}

class CartModel extends ChangeNotifier{
  final List<String> _cart = [];
  List<String> get cart => _cart;
  void addItem(String item) {
    _cart.add(item);
    notifyListeners();
  }
  int get count => _cart.length;
}