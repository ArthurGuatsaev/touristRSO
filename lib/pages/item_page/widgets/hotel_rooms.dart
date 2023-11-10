import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/domain/model/general_model.dart';
import '../../../search/view/search_bloc/blok.dart';
import 'dialogs.dart';

class HotelRooms extends StatefulWidget {
  const HotelRooms({super.key});

  @override
  State<HotelRooms> createState() => _HotelRoomsState();
}

class _HotelRoomsState extends State<HotelRooms> with TickerProviderStateMixin {
  late AnimationController controllerX = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 250));
  late AnimationController controllerY = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300));
  late AnimationController controllerZ = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 350));
  late AnimationController controllerT = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400));
  late OverlayEntry overlayEntry;
  final _key = GlobalKey();
  final _listRoomIcons = [
    const Icon(Icons.home),
    const Icon(Icons.home),
    const Icon(Icons.home),
    const Icon(Icons.home),
  ];
  late final _listControllers = [
    controllerX,
    controllerY,
    controllerZ,
    controllerT
  ];
  showOverlay() {
    final render = (_key.currentContext!.findRenderObject() as RenderBox);
    final offset = render.localToGlobal(Offset.zero);
    final overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        bottom: MediaQuery.of(context).size.height -
            offset.dy +
            render.size.height * 0.5,
        left: offset.dx,
        child: Column(children: [
          for (var i = 0; i < _listControllers.length; i++)
            FadeTransition(
              opacity:
                  Tween<double>(begin: 0, end: 1).animate(_listControllers[i]),
              child: SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                        .animate(_listControllers[i]),
                child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                  final model = state.model.item as Hotels;
                  final rooms = [
                    model.oneRoom,
                    model.twoRoom,
                    model.poluLuxe,
                    model.luxe
                  ];
                  return GestureDetector(
                      onTap: () {
                        overlayEntry.remove();
                        controllerX.reset();
                        controllerY.reset();
                        controllerZ.reset();
                        controllerT.reset();
                        myRoomShowAdaptiveDialog(
                            context: context, images: rooms[i]);
                      },
                      child: _listRoomIcons[i]);
                }),
              ),
            ),
        ]),
      );
    });
    overlayState.insert(overlayEntry);
  }

  @override
  void dispose() {
    controllerX.dispose();
    controllerY.dispose();
    controllerZ.dispose();
    controllerT.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controllerX.isCompleted) {
          controllerX.reverse();
          controllerY.reverse();
          controllerZ.reverse();
          controllerT.reverse().whenComplete(() => overlayEntry.remove());
        } else {
          controllerX.forward();
          controllerY.forward();
          controllerZ.forward();
          controllerT.forward();
          showOverlay();
        }
        setState(() {});
      },
      child: Icon(key: _key, Icons.account_balance),
    );
  }
}
