import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatefulWidget {
  final List<String> images;
  const PageViewItem({super.key, required this.images});

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {

  PageController controller = PageController();
 
  
  DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  bool allowImplicitScrolling = false;
  // String? restorationId,
  Clip clipBehavior = Clip.hardEdge;
  bool padEnds = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyPageView(images: widget.images,)
    );
  }
}

class MyPageView extends StatefulWidget {
  final List<String> images;
  const MyPageView({super.key, required this.images});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  PageController controller = PageController();
  int vl = 0;
  void onPageChanged(int value) {
    setState(() {
      vl = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
                  controller: controller,
                  onPageChanged: onPageChanged,
                  children: [
                  for (var i = 0; i < widget.images.length; i ++)
                  Image.network(widget.images[i],)
                ]),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                                height: 30,
                                child: 
                               IndicatorLine(buttons: [
                                IndicatorButton(controller: controller, vl: vl, index: 0),
                                IndicatorButton(controller: controller, vl: vl, index: 1),
                                IndicatorButton(controller: controller, vl: vl, index: 2),
                                IndicatorButton(controller: controller, vl: vl, index: 3),
                               ],),),
                  ),
                ),
      ],
    );
  }
}
class IndicatorLine extends StatefulWidget {
  final List<Widget> buttons;
  const IndicatorLine({super.key, required this.buttons});

  @override
  State<IndicatorLine> createState() => _IndicatorLineState();
}

class _IndicatorLineState extends State<IndicatorLine> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: widget.buttons,
    );
  }
}

class IndicatorButton extends StatefulWidget {
  final int index;
  final int vl;
  final PageController controller;
  const IndicatorButton({super.key, required this.controller, required this.vl, required this.index});

  @override
  State<IndicatorButton> createState() => _IndicatorButtonState();
}

class _IndicatorButtonState extends State<IndicatorButton> {
  late int vl = widget.vl;
  late PageController controller = widget.controller;
  @override
  Widget build(BuildContext context) {
    return Radio<int>(value: widget.index, groupValue: widget.vl, onChanged: (value) {
              vl = value!;
              controller.animateToPage(widget.index, duration: const Duration(milliseconds: 250), curve: Curves.linear);
            });
  }
}