import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../data/const.dart';

class HomePagePlaceItem extends StatelessWidget {
  final int index;
  const HomePagePlaceItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: placeItemColor,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            placesIcons[places[index]] ?? const Icon(Icons.home),
            Text(
              places[index].tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
