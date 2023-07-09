import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/places.dart';

class PlacesRepository {
  final FirebaseFirestore _firebaseFirestore;
  PlacesRepository({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  final String _collection = 'places';

  // Получение списка красивых мест на главную
  Future<List<Places>> takePlaces() async {
    List<Places> places = [];
    await _firebaseFirestore.collection(_collection).get().then((value) {
      value.docs.map((e) {
        final place = Places.fromMap(e.data());
        places.add(place);
      }).toList();
    });
    return places;
  }

  Future<void> setPlace() async {
    const place = Places(
        nameRu: 'Водопад Галдоридон',
        nameEn: 'Galdoridon Falls',
        image: [
          'https://firebasestorage.googleapis.com/v0/b/mywebapp-b8e3d.appspot.com/o/galdoridon.png?alt=media&token=56d31ff2-b1b3-46b3-852e-715e312e669d'
        ],
        descriptionRu:
            'Водопадов в Национальном парке «Алания» много, но Галдоридон такой один. Его высота составляет 35 метров, а мощи его было достаточно, чтобы с годами выбить у подножия горы яму, куда и стекает вода. Галдоридон является одной из самых посещаемых природных достопримечательностей парка «Алания», а туристы нарекли его «Жемчужным» из-за белоснежного цвета воды. Иногда его называют и «водопадом Крошкина», в память о погибшем здесь в 1985 году таганрогском альпинисте В. А. Крошкине. Приезжать к Галдоридону лучше всего в период с конца весны по начало осени, когда природа здесь предстает во всей красе.',
        descriptionEn:
            "There are many waterfalls in Alanya National Park, but Galdoridon is one. Its height is 35 meters, and its power was enough over the years to knock out a hole at the foot of the mountain, where the water flows down. Galdoridon is one of the most visited natural attractions in Alanya Park, and tourists nicknamed it «Pearl» because of the snow-white color of the water. Sometimes it is also called «Kroshkin waterfall», in memory of Taganrog climber V. Kroshkin, who died here in 1985. The best time to visit Galdoridon is from late spring to early autumn, when the nature is in its full glory.",
        coordinates: '42.76755, 44.36210');
    await _firebaseFirestore.collection(_collection).doc().set(place.toMap());
  }
}
