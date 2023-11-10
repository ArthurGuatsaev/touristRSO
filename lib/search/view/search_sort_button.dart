import 'package:flutter/material.dart';
import 'package:my_webapp/search/view/search_bloc/blok.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDropButton extends StatelessWidget {
  final List<DropdownMenuItem<String>> _list;
  const SearchDropButton(
      {super.key, required List<DropdownMenuItem<String>> list})
      : _list = list;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: _list,
      onChanged: (value) {
        context.read<SearchBloc>().add(AddSortEvent(sort: value!));
      },
    );
  }
}

const List<DropdownMenuItem<String>> sortList = [
  DropdownMenuItem<String>(
    value: 'по рейтингу',
    child: Icon(Icons.dinner_dining_sharp),
  ),
  DropdownMenuItem<String>(
    value: 'по популярности',
    child: Icon(Icons.hotel),
  ),
  DropdownMenuItem<String>(
    value: 'ближайшие',
    child: Icon(Icons.place),
  ),
  DropdownMenuItem<String>(
    value: 'по цене',
    child: Icon(Icons.hiking),
  ),
  DropdownMenuItem<String>(
    value: 'tour',
    child: Icon(Icons.tour),
  ),
];
const List<DropdownMenuItem<String>> tagsRestourants = [
  DropdownMenuItem<String>(
    value: 'kavkaz_kichen',
    child: Icon(Icons.boy),
  ),
  DropdownMenuItem<String>(
    value: 'european_kichen',
    child: Icon(Icons.euro_sharp),
  ),
  DropdownMenuItem<String>(
    value: 'national_kichen',
    child: Icon(Icons.star),
  ),
  DropdownMenuItem<String>(
    value: 'at_mountain',
    child: Icon(Icons.hiking),
  ),
  DropdownMenuItem<String>(
    value: 'live_music',
    child: Icon(Icons.music_note),
  ),
];
