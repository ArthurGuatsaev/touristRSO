import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_webapp/colors.dart';
import 'package:my_webapp/data/const.dart';
import 'package:my_webapp/pages/widgets/place_discription.dart';
import 'package:shimmer/shimmer.dart';

import '../../../data/bloc/places/places_bloc.dart';
import '../../../generated/locale_keys.g.dart';

class HomePageDesktop extends StatefulWidget {
  const HomePageDesktop({super.key});

  @override
  State<HomePageDesktop> createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop>
    with TickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 500));
  late final Animation _animation =
      Tween<double>(begin: 3.14 + 1.55, end: 6.28).animate(animationController);
  OverlayEntry? overlayEntry;
  @override
  void dispose() {
    // animationController.dispose();
    if (mounted) {
      if (overlayEntry != null) {
        overlayEntry!.remove();
        overlayEntry!.dispose();
      }
    }
    super.dispose();
  }

  _showOverLay(
      {required RenderBox renderBox,
      required String desc,
      required String title}) async {
    OverlayState? overlayState = Overlay.of(context);
    if (overlayEntry != null) {
      overlayEntry!.remove();
    }
    Offset offset = renderBox.localToGlobal(Offset.zero);
    overlayEntry = OverlayEntry(
      builder: (context) => AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Positioned(
                top: offset.dy,
                right: renderBox.size.width + 5,
                child: Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()..rotateY(_animation.value),
                    child: PlaceDiscription(
                      desc: desc,
                      title: title,
                      height: renderBox.size.height,
                    )));
          }),
    );

    animationController.reset();
    animationController.forward();
    overlayState.insert(overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (overlayEntry != null) {
                overlayEntry!.remove();
                overlayEntry = null;
              }
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/mywebapp-b8e3d.appspot.com/o/bg.png?alt=media&token=e1ca74d6-8785-4194-9b75-f71fd42bdef2',
                        ).image)),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2),
                        ),
                        SliverToBoxAdapter(
                          child: Center(
                            child: Text(
                              LocaleKeys.title.tr(),
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.07),
                        ),
                        SliverGrid.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  mainAxisExtent: 150),
                          itemCount: places.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: placeItemColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  placesIcons[places[index]] ??
                                      const Icon(Icons.home),
                                  Text(
                                    places[index].tr(),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<PlacesBloc, PlacesState>(
                buildWhen: (previous, current) =>
                    previous.places.length != current.places.length,
                builder: (context, state) {
                  final places = state.places;
                  return CustomScrollView(
                    slivers: [
                      SliverList.builder(
                        itemCount: places.length,
                        itemBuilder: (context, index) {
                          final place = places[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 5),
                            child: Builder(
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    final render =
                                        context.findRenderObject() as RenderBox;
                                    _showOverLay(
                                        renderBox: render,
                                        desc: place.descriptionRu,
                                        title: place.nameRu);
                                  },
                                  child: CarouselSlider.builder(
                                    options: CarouselOptions(
                                        padEnds: false,
                                        autoPlay: true,
                                        viewportFraction: 1,
                                        aspectRatio: 16 / 12),
                                    itemCount: place.image.length,
                                    itemBuilder: (context, index, ind) {
                                      return CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: place.image[0],
                                        placeholder: (context, url) =>
                                            AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: Shimmer.fromColors(
                                              baseColor: const Color.fromARGB(
                                                  255, 188, 186, 186),
                                              highlightColor: Colors.white,
                                              child: Container(
                                                color: Colors.white,
                                              )),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error,
                                                color: Colors.black),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
