import 'package:flutter/material.dart';

import '../generated/locale_keys.g.dart';

const List<String> places = [
  LocaleKeys.restorant,
  LocaleKeys.hotel,
  LocaleKeys.active,
  LocaleKeys.cinema,
  LocaleKeys.musiam,
  LocaleKeys.places,
  LocaleKeys.suveniers,
  LocaleKeys.excursion,
];

const Map<String, Icon> placesIcons = {
  LocaleKeys.restorant: Icon(Icons.ramen_dining_sharp),
  LocaleKeys.hotel: Icon(Icons.hotel_rounded),
  LocaleKeys.active: Icon(Icons.terrain),
  LocaleKeys.cinema: Icon(Icons.movie_creation_rounded),
  LocaleKeys.musiam: Icon(Icons.museum),
  LocaleKeys.places: Icon(Icons.place),
  LocaleKeys.suveniers: Icon(Icons.shopping_bag_rounded),
  LocaleKeys.excursion: Icon(Icons.newspaper_outlined)
};
