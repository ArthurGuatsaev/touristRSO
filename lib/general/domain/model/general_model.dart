import 'package:isar/isar.dart';
import 'package:my_webapp/general/domain/model/work_time_model.dart';

@collection
class BaseGeneralModel {
  final String name;
  final String id;
  final String mainCategory;
  final Set<String> teg;
  final String description;
  final WorkTimeModel workTime;
  final ItemRating rating;
  final List<ResponseModel> rate;
  final bool visible;
  final String mainImage;
  final List<String> images;
  final int costs;
  final double lantitude;
  final double longitude;
  const BaseGeneralModel.test(
      {this.name = '',
      this.visible = true,
      this.mainImage = '',
      this.images = const [],
      this.costs = 0,
      this.rating = const ItemRating(listRate: {}),
      this.id = '',
      this.mainCategory = '',
      this.description = '',
      this.lantitude = 0.0,
      this.longitude = 0.0,
      this.rate = const [],
      this.teg = const {},
      this.workTime = const WorkTimeModel()});
  const BaseGeneralModel(
      {required this.visible,
      required this.mainImage,
      required this.images,
      required this.costs,
      required this.name,
      required this.id,
      required this.mainCategory,
      required this.teg,
      required this.description,
      required this.lantitude,
      required this.longitude,
      required this.rate,
      required this.rating,
      required this.workTime});
  @override
  String toString() {
    return '\n$name, cost: $costs, work_time: ${workTime.workStatus!.intoString}';
  }

  BaseGeneralModel copyWith(
      {String? name,
      String? id,
      String? mainImage,
      List<String>? images,
      int? costs,
      bool? visible,
      String? mainCategory,
      Set<String>? teg,
      String? description,
      WorkTimeModel? workTime,
      ItemRating? rating,
      List<ResponseModel>? rate,
      double? lantitude,
      double? longitude}) {
    return BaseGeneralModel(
        name: name ?? this.name,
        visible: visible ?? this.visible,
        images: images ?? this.images,
        mainImage: mainImage ?? this.mainImage,
        costs: costs ?? this.costs,
        id: id ?? this.id,
        mainCategory: mainCategory ?? this.mainCategory,
        teg: teg ?? this.teg,
        description: description ?? this.description,
        lantitude: lantitude ?? this.lantitude,
        longitude: longitude ?? this.longitude,
        rate: rate ?? this.rate,
        rating: rating ?? this.rating,
        workTime: workTime ?? this.workTime);
  }
}
@collection
class Restourant extends BaseGeneralModel {
  final String menu;
  Restourant(
      {this.menu = '',
      required super.name,
      required super.mainImage,
      required super.costs,
      required super.visible,
      required super.images,
      required super.mainCategory,
      required super.teg,
      required super.description,
      required super.lantitude,
      required super.longitude,
      required super.rate,
      required super.rating,
      required super.workTime,
      required super.id});
  @override
  Restourant copyWith(
      {String? name,
      String? menu,
      String? id,
      String? mainImage,
      List<String>? images,
      int? costs,
      bool? visible,
      String? mainCategory,
      Set<String>? teg,
      String? description,
      WorkTimeModel? workTime,
      ItemRating? rating,
      List<ResponseModel>? rate,
      double? lantitude,
      double? longitude}) {
    return Restourant(
        name: name ?? this.name,
        menu: menu ?? this.menu,
        id: id ?? this.id,
        visible: visible ?? this.visible,
        images: images ?? this.images,
        mainImage: mainImage ?? this.mainImage,
        costs: costs ?? this.costs,
        mainCategory: mainCategory ?? this.mainCategory,
        teg: teg ?? this.teg,
        description: description ?? this.description,
        lantitude: lantitude ?? this.lantitude,
        longitude: longitude ?? this.longitude,
        rate: rate ?? this.rate,
        rating: rating ?? this.rating,
        workTime: workTime ?? this.workTime);
  }
}
@collection
class Hotels extends BaseGeneralModel {
  final int stars;
  final List<String> oneRoom;
  final List<String> twoRoom;
  final List<String> luxe;
  final List<String> poluLuxe;
  Hotels(
      {required this.oneRoom,
      required this.twoRoom,
      required this.luxe,
      required this.poluLuxe,
      required super.name,
      this.stars = 3,
      required super.mainImage,
      required super.costs,
      required super.visible,
      required super.images,
      required super.mainCategory,
      required super.teg,
      required super.description,
      required super.lantitude,
      required super.longitude,
      required super.rate,
      required super.rating,
      required super.workTime,
      required super.id});
  @override
  Hotels copyWith(
      {String? name,
      List<String>? oneRoom,
      List<String>? twoRoom,
      List<String>? luxe,
      List<String>? poluLuxe,
      int? stars,
      String? id,
      String? mainCategory,
      String? mainImage,
      List<String>? images,
      int? costs,
      bool? visible,
      Set<String>? teg,
      String? description,
      WorkTimeModel? workTime,
      ItemRating? rating,
      List<ResponseModel>? rate,
      double? lantitude,
      double? longitude}) {
    return Hotels(
        name: name ?? this.name,
        oneRoom: oneRoom ?? this.oneRoom,
        twoRoom: twoRoom ?? this.twoRoom,
        poluLuxe: poluLuxe ?? this.poluLuxe,
        luxe: luxe ?? this.luxe,
        stars: stars ?? this.stars,
        id: id ?? this.id,
        visible: visible ?? this.visible,
        images: images ?? this.images,
        mainImage: mainImage ?? this.mainImage,
        costs: costs ?? this.costs,
        mainCategory: mainCategory ?? this.mainCategory,
        teg: teg ?? this.teg,
        description: description ?? this.description,
        lantitude: lantitude ?? this.lantitude,
        longitude: longitude ?? this.longitude,
        rate: rate ?? this.rate,
        rating: rating ?? this.rating,
        workTime: workTime ?? this.workTime);
  }
}
@collection
class Plays extends BaseGeneralModel {
  Plays(
      {required super.name,
      required super.mainImage,
      required super.costs,
      required super.visible,
      required super.images,
      required super.mainCategory,
      required super.teg,
      required super.description,
      required super.lantitude,
      required super.longitude,
      required super.rate,
      required super.rating,
      required super.workTime,
      required super.id});
  @override
  Plays copyWith(
      {String? name,
      String? id,
      String? mainCategory,
      String? mainImage,
      List<String>? images,
      int? costs,
      bool? visible,
      Set<String>? teg,
      String? description,
      WorkTimeModel? workTime,
      ItemRating? rating,
      List<ResponseModel>? rate,
      double? lantitude,
      double? longitude}) {
    return Plays(
        name: name ?? this.name,
        id: id ?? this.id,
        visible: visible ?? this.visible,
        images: images ?? this.images,
        mainImage: mainImage ?? this.mainImage,
        costs: costs ?? this.costs,
        mainCategory: mainCategory ?? this.mainCategory,
        teg: teg ?? this.teg,
        description: description ?? this.description,
        lantitude: lantitude ?? this.lantitude,
        longitude: longitude ?? this.longitude,
        rate: rate ?? this.rate,
        rating: rating ?? this.rating,
        workTime: workTime ?? this.workTime);
  }
}
@collection
class Musemums extends BaseGeneralModel {
  Musemums(
      {required super.name,
      required super.mainImage,
      required super.costs,
      required super.visible,
      required super.images,
      required super.mainCategory,
      required super.teg,
      required super.description,
      required super.lantitude,
      required super.longitude,
      required super.rate,
      required super.rating,
      required super.workTime,
      required super.id});
  @override
  Musemums copyWith(
      {String? name,
      String? id,
      String? mainCategory,
      String? mainImage,
      List<String>? images,
      int? costs,
      bool? visible,
      Set<String>? teg,
      String? description,
      WorkTimeModel? workTime,
      ItemRating? rating,
      List<ResponseModel>? rate,
      double? lantitude,
      double? longitude}) {
    return Musemums(
        name: name ?? this.name,
        id: id ?? this.id,
        visible: visible ?? this.visible,
        images: images ?? this.images,
        mainImage: mainImage ?? this.mainImage,
        costs: costs ?? this.costs,
        mainCategory: mainCategory ?? this.mainCategory,
        teg: teg ?? this.teg,
        description: description ?? this.description,
        lantitude: lantitude ?? this.lantitude,
        longitude: longitude ?? this.longitude,
        rate: rate ?? this.rate,
        rating: rating ?? this.rating,
        workTime: workTime ?? this.workTime);
  }
}
@collection
class ItemRating {
  final Map<String, double> _listRate;
  Map<String, double> get listRating => _listRate;
  double get rating => _listRate.isNotEmpty
      ? _listRate.values.reduce(
          (value, element) => (value + element) / _listRate.values.length)
      : 0;
  const ItemRating({required Map<String, double> listRate})
      : _listRate = listRate;
}
@collection
class ResponseModel {
  final String name;
  final String text;
  final String date;
  ResponseModel({this.name = '', this.text = '', this.date = ''});
}

enum PlaceCategory {
  restourants,
  hotels,
  places,
  museum;

  String get cc {
    return '';
  }
}

extension IntoCategory on String {
  PlaceCategory get toCategories {
    switch (this) {
      case 'restourants':
        return PlaceCategory.restourants;
      case 'hotels':
        return PlaceCategory.hotels;
      case 'places':
        return PlaceCategory.places;
      default:
        return PlaceCategory.restourants;
    }
  }
}
