import 'package:flutter/material.dart';
import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/pages/list_item/widgets/list_item_place.dart';
import 'package:my_webapp/search/view/search_bloc/blok.dart';
import 'package:my_webapp/search/view/search_sort_button.dart';
import 'dart:math' as math;

import 'package:my_webapp/search/view/search_teg_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  final List<BaseGeneralModel> initialList;
  const SearchView({super.key, this.initialList = const []});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(flexibleSpace: TagsAndSearchWidget()),
        PlacesList(initialList: widget.initialList)
      ],
    );
  }
}

class TagsAndSearchWidget extends StatefulWidget {
  const TagsAndSearchWidget({
    super.key,
  });

  @override
  State<TagsAndSearchWidget> createState() => _TagsAndSearchWidgetState();
}

class _TagsAndSearchWidgetState extends State<TagsAndSearchWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 250));
  late final Animation<double> _animationSearch =
      Tween<double>(begin: 0, end: math.pi / 2).animate(_controller);
  late final Animation<double> _animationTags =
      Tween<double>(begin: math.pi / 2, end: 0).animate(_controller);
  late final Animation<Offset> _animationPositionSearch =
      Tween<Offset>(begin: Offset.zero, end: const Offset(0, -0.5))
          .animate(_controller);
  late final Animation<Offset> _animationPositionTags =
      Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero)
          .animate(_controller);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (details) {
        _controller.isCompleted ? _controller.reverse() : _controller.forward();
      },
      child: AnimatedBuilder(
          animation: Listenable.merge([_animationSearch, _animationTags]),
          builder: (context, widget) {
            return Center(
                child: Stack(
              alignment: Alignment.center,
              children: [
                SlideTransition(
                  position: _animationPositionSearch,
                  child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateX(_animationSearch.value),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.amber,
                      )),
                ),
                SlideTransition(
                    position: _animationPositionTags,
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..rotateX(_animationTags.value),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 100,
                                child: SearchDropButton(list: sortList),
                              ),
                              Expanded(child: SearchTegButton()),
                            ],
                          ),
                        )))
              ],
            ));
          }),
    );
  }
}

class PlacesList extends StatelessWidget {
  final List<BaseGeneralModel> initialList;
  const PlacesList({super.key, required this.initialList});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (previous, current) =>
            previous.model.found != current.model.found,
        builder: (context, state) {
          final result = state.model.found;
          return SliverList.builder(
            itemCount: result.length,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 16 / 6,
                child: ItemPlace(index: index),
              );
            },
          );
        });
  }
}
