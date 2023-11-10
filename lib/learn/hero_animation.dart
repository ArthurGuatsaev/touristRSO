import 'package:flutter/material.dart';

class MyFirstPage extends StatelessWidget {
  const MyFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'hero',
            child: Container(color: Colors.black, height: 199, width: 100,)),
          Hero(
            tag: '1',
            child: Container(color: Colors.red, height: 20, width: 100,)),
          Hero(
            tag: '2',
            child: Container(color: Colors.green, height: 119, width: 20,)),
          Hero(
            tag: '3',
            child: Container(color: Colors.grey, height: 100, width: 200,)),
          IconButton(icon: const Icon(Icons.navigate_next), onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, _, __) {
                  return const MySecondPage();
            },
            transitionsBuilder: (___, Animation<double> animation, ____, Widget child) {
              return FadeTransition(
                opacity: animation,       
                child: RotationTransition(
                  turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                  child: child,
                ),
    );}
            ));
          },),
        ],
      )),
    );
  }
}


class MySecondPage extends StatelessWidget {
  const MySecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'hero',
            child: Container(color: Colors.red, width: 100, height: 100,)),
            Hero(
            tag: '1',
            child: Container(color: Colors.blue, height: 100, width: 20,)),
          Hero(
            tag: '2',
            child: Container(color: Colors.amber, height: 20, width: 20,)),
          Hero(
            tag: '3',
            child: Container(color: Colors.black, height: 200, width: 100,)),
          IconButton(icon: const Icon(Icons.navigate_before), onPressed: () {
            Navigator.of(context).pop();
          },),
        ],
      )),
    );
  }
}