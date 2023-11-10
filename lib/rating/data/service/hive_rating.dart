class HiveServiceRating {
  const HiveServiceRating();
  // сохраняем все изменения, в случае отсутствия подключения к сети, в один бокс;
  Future<void> deleteRating({required String category, required String playsId, required String userId}) async {
    //Hive.saveBox('deleteRating').save(currentRating);
  }
  Future<void> addRating({required String category, required String playsId, required double newNumber, required String userId}) async {
    // сохраняем в нужную категорию в общий бокс
    // сохраняем в бокс для отправки данных на сервер
  }
  Future<void> changeRating({required String category, required String playsId, required String userId, required double newNumber}) async {}
}