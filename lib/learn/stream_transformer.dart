import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: _MyWidget(),));
}
class _MyWidget extends StatefulWidget {
  const _MyWidget({super.key});

  @override
  State<_MyWidget> createState() => __MyWidgetState();
}

class __MyWidgetState extends State<_MyWidget> {
  final StreamController<_Item> _streamController = StreamController<_Item>.broadcast();
  void startStream() async {
    bool finish = false;
    Timer(const Duration(seconds: 50), () {finish = true;});
    while (!finish) {
      await Future.delayed(const Duration(seconds: 2));
      _streamController.add(_Item(name: '${Random().nextInt(1000)}' ,color: Color.fromRGBO(Random().nextInt(265), Random().nextInt(265), Random().nextInt(265), 1), cost: Random().nextDouble() * 100));
    }
    
  }
  final List<_Item> list = [];
  @override
  void initState() {
    super.initState();
    startStream();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: StreamBuilder(
        stream: _streamController.stream,
        builder: (context, stream) {
          if (stream.hasData) {
          list.add(stream.data!);
         return  ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                color: list[index].color,
              );
            }
          );
           } 
           return const Icon(Icons.error);
        }
      ))
    );
  }
}

class _Item {
  final String name;
  final Color color;
  final double cost;
  String? title;
  _Item({this.name = '', this.color = Colors.red, this.cost = 0, this.title});
  @override
  String toString() {
    return name;
  }
  set value(String value) => title = value;
}
