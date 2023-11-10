import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: _MyIndexStack(),));
}
class _MyIndexStack extends StatefulWidget {
  const _MyIndexStack({super.key});

  @override
  State<_MyIndexStack> createState() => __MyIndexStackState();
}

class __MyIndexStackState extends State<_MyIndexStack> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Draggable<String>(
            data: 'red',
            feedback: Container(color: Colors.red, width: 100, height: 100, ),
            childWhenDragging: const SizedBox( width: 100, height: 100, ),
            onDragCompleted: () => print('complete'), 
            child: Container(color: Colors.red, width: 100, height: 100,),
            ),
            DragTarget<String>(
              onWillAccept: (data) {
                return data == 'red';
              },
              onAccept: (data) {
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(color: Colors.pink,)));
                  
                });
              },
              onLeave: (data) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(color: Colors.blue,)));
                
              },
              builder: (context, candidateData, rejectedData) {
              return Container(height: 300, width: 300, color: Colors.blue);
            },
            ),
            LongPressDraggable<String>(
              data: 'data',
              feedback: Container(height: 150, width: 150, color: Colors.pink,),
              child: Container(height: 100, width: 100, color: Colors.pink,),
              ),
              DragTarget<String>(builder: (context, candidateData, rejectedData) {
                return Container(color: Colors.green, height: 100, width: 100,);
              },),
              Visibility(
                visible: false,
                child: Container(color: Colors.purple, height: 100, width: 100,))
        ],
      ) )
    );
  }
}