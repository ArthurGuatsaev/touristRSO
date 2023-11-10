import 'package:flutter/material.dart';
import 'dart:math' as math;

class SearchTegWidget extends StatefulWidget {
  const SearchTegWidget({super.key});

  @override
  State<SearchTegWidget> createState() => _SearchTegWidgetState();
}

class _SearchTegWidgetState extends State<SearchTegWidget> with TickerProviderStateMixin{
  late final controllerSearch = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final animateSearch = Tween<double>(begin: 0, end: math.pi / 2).animate(controllerSearch);
  late final controllerTegs = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final animateTegs = Tween<double>(begin: (3 * math.pi) / 2, end: 2 * math.pi).animate(controllerTegs);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        if (animateTegs.status == AnimationStatus.completed) {
          controllerSearch.reverse();
          controllerTegs.reverse();
        } else {
        controllerSearch.forward();
        controllerTegs.forward();
        }
        setState(() {},
        );
      }),
      body: Center(child: 
      AnimatedBuilder(
        animation: Listenable.merge([animateSearch, animateTegs,],),
        builder: (context, widget) {
          return Stack(children: [
            SearchTextView(rotation: animateSearch.value,),
            SearchTegs(rotation: animateTegs.value,)
          ]);
        }
      )
    ));
  }
}

class SearchTegs extends StatelessWidget {
  final double rotation;
  const SearchTegs({
    required this.rotation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      transformAlignment: Alignment.bottomCenter,
      transform: Matrix4.rotationX(rotation),
      width: MediaQuery.of(context).size.width - 20, 
      height: 40, 
      color: Colors.blueGrey, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ElevatedButton(
          onPressed: (){}, 
          child: const Icon(Icons.done))));
  }
}

class SearchTextView extends StatelessWidget {
  final double rotation;
  const SearchTextView({
    super.key,
    required this.rotation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      transformAlignment: Alignment.bottomCenter,
      transform: Matrix4.rotationX(rotation),
      width: MediaQuery.of(context).size.width - 20, 
      height: 40, 
      color: Colors.grey, 
      child: const Icon(Icons.home));
  }
}