/*
1. rating_view;
2. response_view;
*/

// test;
// contacts page;
// adaptive view all pages*;
// local logic;

// import 'package:my_webapp/general/domain/general_model.dart';


import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/general/domain/model/work_time_model.dart';

Stream<List<Map<String,String>>> streamResponses = streamResponse();
Stream<List<double>> streamRating = streamRatting(); 
Stream<List<double>> streamRatting() async* {
  yield [1.9];
}
Stream<List<Map<String, String>>> streamResponse() async* {
  yield [{'': ''}];
}

List<Restourant> rest = [
  Restourant(name: 'dendrarium',mainImage: '', costs: 0, id: '',images: [], visible: true, menu: '', mainCategory: 'restourant', teg: {'evropean kitchen', 'kavkazian kichen', 'city inside'}, description: 'description', lantitude: 0.2, longitude: 0/4, rate: [], rating: const ItemRating(listRate: {'':5, '4': 4.5}), workTime: WorkTimeModel(weekWorkTime: weekWorkTime)),
  Restourant(name: 'kavkaz',mainImage: '', costs: 0, id: '',images: [], visible: true, menu: '', mainCategory: 'restourant', teg: { 'kavkazian kichen', 'city inside'}, description: 'description', lantitude: 0.2, longitude: 0/4, rate: [], rating: const ItemRating(listRate: {'':5, '4': 1.5}), workTime: WorkTimeModel(weekWorkTime: weekWorkTime)),
  Restourant(name: 'europe',mainImage: '', costs: 0, id: '',images: [], visible: true, menu: '', mainCategory: 'restourant', teg: {'evropean kitchen', 'city inside'}, description: 'description', lantitude: 0.2, longitude: 0/4, rate: [], rating: const ItemRating(listRate: {'':5, '4': 2.5}), workTime: WorkTimeModel(weekWorkTime: weekWorkTime)),
  Restourant(name: 'karkade',mainImage: '', costs: 0, id: '',images: [], visible: true, menu: '', mainCategory: 'restourant', teg: {'evropean kitchen', 'kavkazian kichen'}, description: 'description', lantitude: 0.2, longitude: 0/4, rate: [], rating: const ItemRating(listRate: {'':5, '4': 4.5}), workTime: WorkTimeModel(weekWorkTime: weekWorkTime)),
  Restourant(name: 'madam',mainImage: '', costs: 0, id: '',images: [], visible: true, menu: '', mainCategory: 'restourant', teg: {'evropean kitchen', 'kavkazian kichen', 'city inside'}, description: 'description', lantitude: 0.2, longitude: 0/4, rate: [], rating: const ItemRating(listRate: {'':5, '4': 3.5}), workTime: WorkTimeModel(weekWorkTime: weekWorkTime)),
  Restourant(name: 'bazar',mainImage: '', costs: 0, id: '',images: [], visible: true, menu: '', mainCategory: 'restourant', teg: {'evropean kitchen', 'kavkazian kichen', 'city inside', 'my favorite'}, description: 'description', lantitude: 0.2, longitude: 0/4, rate: [], rating: const ItemRating(listRate: {'': 4}), workTime: WorkTimeModel(weekWorkTime: weekWorkTime2)),
];
final weekWorkTime = {
  'пн': const DayOpenAndClosed(opened: '10:10', closed: '18:10'),
  'вт': const DayOpenAndClosed(opened: '10:10', closed: '18:10'),
  'ср': const DayOpenAndClosed(opened: '10:10', closed: '18:10'),
  'чт': const DayOpenAndClosed(opened: '10:10', closed: '18:10'),
  'пт': const DayOpenAndClosed(opened: '10:10', closed: '18:10'),
  'сб': const DayOpenAndClosed(opened: '10:10', closed: '18:00'),
  'вс': const DayOpenAndClosed(opened: '10:10', closed: '23:10'),
};
final weekWorkTime2 = {
  'пн': const DayOpenAndClosed(opened: '10:10', closed: '18:10'),
  'вт': const DayOpenAndClosed(opened: '10:10', closed: '18:10'),
  'ср': const DayOpenAndClosed(opened: '10:10', closed: '18:10'),
  'чт': const DayOpenAndClosed(opened: '10:10', closed: '18:10'),
  'пт': const DayOpenAndClosed(opened: '10:10', closed: '18:10'),
  'сб': const DayOpenAndClosed(opened: '10:10', closed: '18:00'),
  'вс': const DayOpenAndClosed(opened: '10:10', closed: '01:10'),
};
// Зачем нужен навигатор обсервер?
// Как правильно тестировать приложение?
// MaterialApp.router (routerDelegate, RouterConfig) как пользоваться, в чем различия, зачем применять?
// посмотреть видео с реализацией dragble, dragtarget
// void main() {
//   getEn();
// }
//   void getEn() async {
//     final isolate = await Isolate.run(() => DataSearchRepository(initialList: rest, tegs: {'evropean kitchen'}).search(searchList: ['evropean kitchen'], list: rest, sort: ''));
//     print(isolate.length);
//   }



