import 'package:flutter/material.dart';
import 'package:my_webapp/search/view/search_bloc/blok.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTegButton extends StatefulWidget {
  const SearchTegButton({super.key});

  @override
  State<SearchTegButton> createState() => _SearchTegButtonState();
}

class _SearchTegButtonState extends State<SearchTegButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      final listTags = state.model.tegs.toList();
      return ListView(
        padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
        scrollDirection: Axis.horizontal,
        children: [
          for (var i = 0; i < listTags.length; i++)
            ElevatedButton(
              onPressed: () {
                context
                    .read<SearchBloc>()
                    .add(AddSearchTeg(search: listTags[i]));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: state.model.activeTags.contains(listTags[i])
                    ? Colors.blueGrey
                    : Colors.grey,
              ),
              child: const Text('widget.teg'),
            ),
        ],
      );
    });
  }
}
