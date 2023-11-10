import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../search/view/search_bloc/blok.dart';
import '../../../search/view/search_view.dart';
import '../widgets/list_item_place.dart';

class PhoneAlbomListItems extends StatelessWidget {
  const PhoneAlbomListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverAppBar(
        flexibleSpace: SizedBox(child: TagsAndSearchWidget()),
      ),
       BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (previous, current) => previous.model.found != current.model.found,
         builder: (context, state) {
          final result = state.model.found;
           return SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 340, childAspectRatio: 16/6, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: result.length,
              itemBuilder: (context, index) {
                return ItemPlace(index: index,);
              },);
         }
       ),
    ],);
  }
}