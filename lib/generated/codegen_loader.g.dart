// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "title": "Северная Осетия - Алания",
  "restorant": "Рестораны",
  "places": "Красивые места",
  "musiam": "Музеи",
  "cinema": "Кинотеатры",
  "suveniers": "Сувениры",
  "excursion": "Экскурсии",
  "active": "Активный отдых",
  "hotel": "Гостиницы"
};
static const Map<String,dynamic> en = {
  "title": "Noth Osetia - Alania",
  "restorant": "restorants",
  "places": "Beautiful places",
  "musiam": "Musiams",
  "cinema": "Cinema",
  "suveniers": "Suveniers",
  "excursion": "Excursion",
  "active": "Active relax",
  "hotel": "Hotels"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en};
}
