import 'package:flutter/material.dart';

class ScrollSearch extends StatefulWidget {
  const ScrollSearch({super.key});

  @override
  State<ScrollSearch> createState() => _ScrollSearchState();
}

class _ScrollSearchState extends State<ScrollSearch> {
  late final controller = ScrollController();
  bool stretch = true;
  bool snap = true;
  bool pinned = true;
  void changeStretch() {
    stretch = !stretch;
    setState(() {});
  }
  void changeSnap() {
    snap = !snap;
    setState(() {});
  }
  void changePinned() { // скрывает аппбар при скролле вниз и показывает при движении вверх
    pinned = !pinned;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(children: [
        IconButton(onPressed: changePinned, icon: const Icon(Icons.piano)),
        IconButton(onPressed: changeSnap, icon: const Icon(Icons.snapchat_outlined)),
        IconButton(onPressed: changeStretch, icon: const Icon(Icons.stadium))
      ]),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Container(height: 20, width: 400, color: Colors.blue,),
            stretch: stretch,
            snap: snap,
            pinned: pinned,
            floating: true
          ),
          SliverList.builder(itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              color: Colors.blueGrey,
              height: 50,
            );
          })
        ],
      )
    );
  }
}