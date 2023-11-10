import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/general/domain/model/work_time_model.dart';

class GeneralApiModel {
  final String name;
  final String id;
  final String mainCategory;
  final Set<dynamic> teg;
  final String description;
  final WorkTimeModel workTime;
  final ItemRating rating;
  final List<dynamic> rate;
  final bool visible;
  final String mainImage;
  final List<dynamic> images;
  final int costs;
  final String lantitude;
  final String longitude;
  const GeneralApiModel(
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
  const GeneralApiModel.test(
      {this.visible = true,
      this.mainImage = '',
      this.images = const [],
      this.costs = 0,
      this.name = '',
      this.id = '',
      this.mainCategory = '',
      this.description = '',
      this.lantitude = '0.0',
      this.longitude = '0.0',
      this.rate = const [],
      this.rating = const ItemRating(listRate: {}),
      this.teg = const {},
      this.workTime = const WorkTimeModel()});
  Map<String, dynamic> toJson(GeneralApiModel model) {
    return {
      'name': name,
      'id': id,
      'mainCategory': mainCategory,
      'teg': teg,
      'description': description,
      'workTime': workTime,
      'rating': rating,
      'rate': rate,
      'lantitude': lantitude,
      'longitude': longitude
    };
  }

  GeneralApiModel fromJson(Map<String, dynamic> json) {
    return GeneralApiModel(
        name: json['name'],
        visible: json['visible'],
        images: json['images'],
        mainImage: json['mainImage'],
        costs: json['mainImage'],
        id: json['id'],
        mainCategory: json['mainCategory'],
        teg: json['teg'],
        description: json['description'],
        lantitude: json['lantitude'],
        longitude: json['longitude'],
        rate: json['rate'],
        rating: json['rating'],
        workTime: json['workTime']);
  }

  BaseGeneralModel fromApi(GeneralApiModel e) {
    if (e is RestourantApi) {
      return Restourant(
          name: e.name,
          mainImage: e.mainImage,
          images: e.images as List<String>,
          costs: e.costs,
          visible: e.visible,
          mainCategory: e.mainCategory,
          teg: (e.teg as Set<String>),
          description: e.description,
          lantitude: double.parse(e.lantitude),
          longitude: double.parse(e.longitude),
          rate: (e.rate as List<ResponseModel>),
          rating: e.rating,
          workTime: e.workTime,
          id: e.id);
    } else if (e is HotelsApi) {
      return Hotels(
          name: e.name,
          luxe: e.luxe,
          oneRoom: e.oneRoom,
          twoRoom: e.twoRoom,
          stars: e.stars,
          poluLuxe: e.poluLuxe,
          mainImage: e.mainImage,
          images: e.images as List<String>,
          costs: e.costs,
          visible: e.visible,
          mainCategory: e.mainCategory,
          teg: (e.teg as Set<String>),
          description: e.description,
          lantitude: double.parse(e.lantitude),
          longitude: double.parse(e.longitude),
          rate: (e.rate as List<ResponseModel>),
          rating: e.rating,
          workTime: e.workTime,
          id: e.id);
    } else if (e is PlaysApi) {
      return Plays(
          name: e.name,
          mainImage: e.mainImage,
          images: e.images as List<String>,
          costs: e.costs,
          visible: e.visible,
          mainCategory: e.mainCategory,
          teg: (e.teg as Set<String>),
          description: e.description,
          lantitude: double.parse(e.lantitude),
          longitude: double.parse(e.longitude),
          rate: (e.rate as List<ResponseModel>),
          rating: e.rating,
          workTime: e.workTime,
          id: e.id);
    }
    throw 'Object type is not founded';
  }
}

class RestourantApi extends GeneralApiModel {
  RestourantApi(
      {required super.name,
      required super.mainCategory,
      required super.teg,
      required super.description,
      required super.lantitude,
      required super.longitude,
      required super.rate,
      required super.rating,
      required super.workTime,
      required super.id,
      required super.visible,
      required super.mainImage,
      required super.images,
      required super.costs});
  const RestourantApi.test(
      {super.visible = true,
      super.mainImage = '',
      super.images = const [],
      super.costs = 0,
      super.name = '',
      super.id = '',
      super.mainCategory = '',
      super.description = '',
      super.lantitude = '0.0',
      super.longitude = '0.0',
      super.rate = const [],
      super.rating = const ItemRating(listRate: {}),
      super.teg = const {},
      super.workTime = const WorkTimeModel()});

  @override
  Map<String, dynamic> toJson(GeneralApiModel model) {
    if (model is RestourantApi) {
      return {
        'name': name,
        'visible': visible,
        'images': images,
        'mainImage': mainImage,
        'costs': costs,
        'mainCategory': mainCategory,
        'teg': teg,
        'description': description,
        'workTime': workTime,
        'rating': rating,
        'rate': rate,
        'lantitude': lantitude,
        'longitude': longitude
      };
    }
    throw 'json is not expected type';
  }

  @override
  RestourantApi fromJson(Map<String, dynamic> json) {
    return RestourantApi(
        name: json['name'],
        visible: json['visible'],
        images: json['images'],
        mainImage: json['mainImage'],
        costs: json['mainImage'],
        mainCategory: json['mainCategory'],
        teg: json['teg'],
        description: json['description'],
        lantitude: json['lantitude'],
        longitude: json['longitude'],
        rate: json['rate'],
        rating: json['rating'],
        workTime: json['workTime'],
        id: json['id']);
  }
}

class HotelsApi extends GeneralApiModel {
  final int stars;
  final List<String> oneRoom;
  final List<String> twoRoom;
  final List<String> luxe;
  final List<String> poluLuxe;
  HotelsApi(
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
  const HotelsApi.test(
      {this.stars = 0,
      this.oneRoom = const [],
      this.twoRoom = const [],
      this.luxe = const [],
      this.poluLuxe = const [],
      super.name = '',
      super.visible = true,
      super.mainImage = '',
      super.images = const [],
      super.costs = 0,
      super.id = '',
      super.mainCategory = '',
      super.description = '',
      super.lantitude = '0.0',
      super.longitude = '0.0',
      super.rate = const [],
      super.rating = const ItemRating(listRate: {}),
      super.teg = const {},
      super.workTime = const WorkTimeModel()});

  @override
  Map<String, dynamic> toJson(GeneralApiModel model) {
    if (model is HotelsApi) {
      return {
        'name': name,
        'visible': visible,
        'images': images,
        'mainImage': mainImage,
        'costs': costs,
        'mainCategory': mainCategory,
        'teg': teg,
        'description': description,
        'workTime': workTime,
        'rating': rating,
        'rate': rate,
        'lantitude': lantitude,
        'longitude': longitude
      };
    }
    throw 'json is not expected type';
  }

  @override
  HotelsApi fromJson(Map<String, dynamic> json) {
    return HotelsApi(
        name: json['name'],
        oneRoom: json['oneRoom'],
        twoRoom: json['twoRoom'],
        luxe: json['luxe'],
        poluLuxe: json['poluLuxe'],
        visible: json['visible'],
        images: json['images'],
        mainImage: json['mainImage'],
        costs: json['mainImage'],
        id: json['id'],
        mainCategory: json['mainCategory'],
        teg: json['teg'],
        description: json['description'],
        lantitude: json['lantitude'],
        longitude: json['longitude'],
        rate: json['rate'],
        rating: json['rating'],
        workTime: json['workTime']);
  }
}

class PlaysApi extends GeneralApiModel {
  PlaysApi(
      {required super.name,
      required super.mainCategory,
      required super.teg,
      required super.description,
      required super.lantitude,
      required super.longitude,
      required super.rate,
      required super.rating,
      required super.workTime,
      required super.id,
      required super.visible,
      required super.mainImage,
      required super.images,
      required super.costs});
  const PlaysApi.test(
      {super.name = '',
      super.visible = true,
      super.mainImage = '',
      super.images = const [],
      super.costs = 0,
      super.id = '',
      super.mainCategory = '',
      super.description = '',
      super.lantitude = '0.0',
      super.longitude = '0.0',
      super.rate = const [],
      super.rating = const ItemRating(listRate: {}),
      super.teg = const {},
      super.workTime = const WorkTimeModel()});

  @override
  Map<String, dynamic> toJson(GeneralApiModel model) {
    if (model is PlaysApi) {
      return {
        'name': name,
        'visible': visible,
        'images': images,
        'mainImage': mainImage,
        'costs': costs,
        'mainCategory': mainCategory,
        'teg': teg,
        'description': description,
        'workTime': workTime,
        'rating': rating,
        'rate': rate,
        'lantitude': lantitude,
        'longitude': longitude
      };
    }
    throw 'json is not expected type';
  }

  @override
  PlaysApi fromJson(Map<String, dynamic> json) {
    return PlaysApi(
        name: json['name'],
        visible: json['visible'],
        images: json['images'],
        mainImage: json['mainImage'],
        costs: json['mainImage'],
        mainCategory: json['mainCategory'],
        teg: json['teg'],
        description: json['description'],
        lantitude: json['lantitude'],
        longitude: json['longitude'],
        rate: json['rate'],
        rating: json['rating'],
        workTime: json['workTime'],
        id: json['id']);
  }
}
