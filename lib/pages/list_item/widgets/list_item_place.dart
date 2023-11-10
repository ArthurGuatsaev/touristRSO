import 'package:flutter/material.dart';
import 'package:my_webapp/search/view/search_bloc/blok.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemPlace extends StatelessWidget {
  final int index;
  const ItemPlace({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width - 10,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: GestureDetector(
        onTap: () {
          // Navigator.of(context).pushNamed('/item');
          // final render = context.findAncestorRenderObjectOfType<RenderBox>();
          //showOverlay(context, render);
        },
        child: BlocBuilder<SearchBloc, SearchState>(
            buildWhen: (previous, current) =>
                previous.model.found[index] != current.model.found[index],
            builder: (context, state) {
              final item = state.model.found[index];
              return Stack(children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueGrey)),
                SpecificWidget(
                  specific: item.teg.first,
                ),
                TitleAndRatingWidget(
                  rating: item.rating.rating,
                  title: item.name,
                ),
              ]);
            }),
      ),
    );
  }
}

class SpecificWidget extends StatelessWidget {
  final String specific;
  const SpecificWidget({super.key, required this.specific});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'specific',
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            width: 200,
            height: 40,
            child: Text(specific),
          ),
        ),
      ),
    );
  }
}

class TitleAndRatingWidget extends StatelessWidget {
  final String title;
  final double rating;
  const TitleAndRatingWidget(
      {super.key, required this.rating, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          width: 100,
          height: 20,
          child: Column(
              children: [Text(title), Hero(tag: 'rating', child: Container())]),
        ),
      ),
    );
  }
}
