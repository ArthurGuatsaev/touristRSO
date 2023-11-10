import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../search/view/search_bloc/blok.dart';
import '../../../search/view/search_view.dart';

class PhoneListItems extends StatelessWidget {
  const PhoneListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverAppBar(
        flexibleSpace: SizedBox(height: 60, child: TagsAndSearchWidget()), //размеры
      ),
       BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (previous, current) => false,
         builder: (context, state) {
           return PlacesList(initialList: state.model.find);
         }
       )
    ],);
  }
}