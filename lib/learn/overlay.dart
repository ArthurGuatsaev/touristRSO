import 'dart:math';

import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(home: OverlayExample(),));
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _OverlayExample()),);
  }
}
class _OverlayExample extends StatefulWidget {
  const _OverlayExample({super.key});

  @override
  State<_OverlayExample> createState() => __OverlayExampleState();
}

class __OverlayExampleState extends State<_OverlayExample> {
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  GlobalKey globalKey = GlobalKey();
  final LayerLink _layerLink = LayerLink();
  @override
  void initState() {
    OverlayState? overlayState = Overlay.of(context);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   globalKey;
    //   });
    
    _focusNode.addListener(() {
      if(_focusNode.hasFocus) {
        _overlayEntry = _createOverlay();
        overlayState.insert(_overlayEntry!);
      } else {
        _overlayEntry!.remove();
      }
    });
    super.initState();
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    return OverlayEntry(builder: (context) => Positioned(
      width: size.width,
      child: CompositedTransformFollower(link: _layerLink, showWhenUnlinked: false, offset: Offset(0, size.height + 5),
      child: Material(elevation: 5, child: Column(children: [
        ListTile(title: Icon(Icons.home),),
        ListTile(title: Icon(Icons.home),),
        ListTile(title: Icon(Icons.home),),
        ListTile(title: Icon(Icons.home),),

      ]),),
      )));
  }
  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
        link: _layerLink,
        child: IconButton(icon: const Icon(Icons.home), onPressed: (){}, focusNode: _focusNode,));
  }
}


class OverlayExample extends StatefulWidget {
  const OverlayExample({super.key});

  @override
  State<OverlayExample> createState() => _OverlayExampleState();
}

class _OverlayExampleState extends State<OverlayExample> {
  final focus = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final overlay = Overlay.of(context);
    focus.addListener(() {
      if (focus.hasFocus) {
        createOverlay(context);
        overlay.insert(overlayEntry!);
      } else {
        overlayEntry!.remove();
      }
    });
  }
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? overlayEntry;
  createOverlay(BuildContext context) {
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(width: 100, height: 500, child: CompositedTransformFollower(link: _layerLink, offset: const Offset(0, 0) ,child: Container(color: Colors.red, height: 50, width: 100,),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        for(var i = 0; i <2; i ++)
         ItemColors(link: _layerLink, focus: focus,)
      ],)
    );
  }
}

class ItemColors extends StatelessWidget {
  final LayerLink link;
  final FocusNode focus;
  const ItemColors({
    super.key,
    required this.link,
    required this.focus
  });

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: link,
      child: Focus(
        focusNode: focus,
        child: Container(color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 0.5) , height: 50, width: MediaQuery.of(context).size.width)));
  }
}