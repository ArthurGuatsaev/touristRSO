import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../search/view/search_bloc/blok.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) => previous.model.item.description != current.model.item.description,
      builder: (context, state) {
        final description = state.model.item.description;
        return Text(description);
      }
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'title',
      child: BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) => previous.model.item.name != current.model.item.name,
      builder: (context, state) {
        final name = state.model.item.name;
        return Text(name);
      }
    ),
    );
  }
}