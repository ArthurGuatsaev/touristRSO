import 'package:flutter/material.dart';

import '../../search/view/search_view.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        switch (constraints.maxWidth) {
          case <600: return const PhoneFavorite();
          case <1500: return Container();
          default: return Container();
        }
      },),
    );
  }
}

class PhoneFavorite extends StatelessWidget {
  const PhoneFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SearchView(initialList: []);
  }
}