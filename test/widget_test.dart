import 'package:flutter/material.dart';
import 'package:my_webapp/general/data/repository/gendata_repository.dart';
import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/general/domain/model/main_model.dart';
import 'package:my_webapp/general/domain/model/work_time_model.dart';
import 'package:my_webapp/learn/for_test.dart';
import 'package:my_webapp/learn/widget_test_example.dart';
import 'package:my_webapp/rating/data/repository/data_rating_repository.dart';
import 'package:my_webapp/search/data/data_search_repository.dart';
import 'package:my_webapp/setting/where_change.dart';
import 'package:my_webapp/weather/data/api_util.dart';
import 'package:my_webapp/weather/domain/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Weather', () {
    group('Weather Api', () {
      const weather = ApiUtil();
      test(
          'проверка ответа на (get) запрос погоды на три дня в WeatherRepository',
          () async {
        expect(
            await weather.getWeather(plays: 'plays'),
            isA<Map<String, WeatherModel>>()
                .having((w) => w, 'погода', isMap)
                .having((w) => w.values.length, 'model', 1));
        // проверка на три дня
      });
    });
  });
  group('RatingAndResponse', () {
    const userId = 'user_id';
    const collection = 'user_id';
    const placeId = 'user_id';
    final repo = DataRatingRepository(saveRating: [], saveResponse: []);
    group('rating_firebase', () {
      test('проверка получения рейтинга Stream', () async {
        expect(
            repo.getRatingStream(name: 'hotels'),
            isA<Stream<List<double>>>().having((w) async {
              List<double> x = [];
              w.listen((event) {
                x = event;
              });
              return x.isNotEmpty;
            }, 'rating', isNotNull));
        // проверка подключения к рейтингу одного из мест
      });
      test('проверка получения рейтинга', () async {
        expect(
            await repo.getRating(id: 'hotels'),
            isA<Map<String, double>>()
                .having((r) => r.isNotEmpty, 'список не пустой', true));
      });
      test('проверка добавления оценки', () async {
        final rating = await repo.getRating(id: 'id');
        final initialCount = rating.values.length;
        await repo.addRating(
            category: 'test',
            playsId: 'test_id',
            newNumber: 4,
            userId: 'userId');
        final newRating = await repo.getRating(id: 'userId');
        expect(newRating.values.length, greaterThan(initialCount));
        expect(newRating[userId] != null, true);
      });
      test('проверка изменения данных рейтинга', () async {
        final rating = await repo.getRating(id: placeId);
        final initialCount = rating.values.length;
        final initialRate = rating[userId]!;
        await repo.changeRating(
            category: collection,
            playsId: placeId,
            newNumber: 5,
            userId: userId);
        final newRating = await repo.getRating(id: 'id');
        expect(newRating.values.length, initialCount);
        expect(newRating[userId]! != initialRate, true);
      });
      test('проверка удаления оценки', () async {
        final rating = await repo.getRating(id: placeId);
        final initialCount = rating.values.length;
        await repo.deleteRating(
            category: collection, playsId: placeId, userId: userId);
        final newRating = await repo.getRating(id: placeId);
        expect(newRating.values.length, lessThan(initialCount));
        expect(newRating[userId] == null, true);
      });
    });
    group('rating_hive', () {
      const userId = 'user_id';
      const collection = 'user_id';
      const placeId = 'user_id';
      final repo = DataRatingRepository(saveRating: [], saveResponse: []);
      final generalRepo = GeneralDataRepository();
      Future<Map<String, double>> getRating() async {
        final initialList =
            await generalRepo.getMenualSaveData(category: collection);
        final initialPlace =
            initialList.where((element) => element.id == placeId).first;
        final initialRating = initialPlace.rating.listRating;
        return initialRating;
      }

      test('проверка добавления оценки Hive', () async {
        final initialRating = await getRating();
        await repo.addSaveRating(
            category: collection,
            playsId: placeId,
            newNumber: 5,
            userId: userId);
        final finalRating = await getRating();
        expect(initialRating.length, greaterThan(finalRating.length));
        expect(finalRating[userId] != null, true);
      });

      test('проверка изменения сохраненных данных рейтинга Hive', () async {
        final initialRating = await getRating();
        await repo.changeSaveRating(
            category: collection,
            playsId: placeId,
            userId: userId,
            newNumber: 4);
        final finalRating = await getRating();
        expect(initialRating.length == finalRating.length, true);
        expect(finalRating[userId] == 4, true);
      });
      test('удаление сохраненной оценки рейтинга Hive', () async {
        final initialRating = await getRating();
        await repo.deleteSaveRating(
            category: collection, playsId: placeId, userId: userId);
        final finalRating = await getRating();
        expect(initialRating.length != finalRating.length, true);
        expect(finalRating[userId], isNull);
      });
    });
    group('response_firebase', () {
      test('проверка получения отзывов', () async {
        final response = await repo.getResponses(id: placeId);
        expect(response, isNotNull);
      });
      test('проверка добавления отзыва', () async {
        final responseModel = ResponseModel(
            name: 'name', text: 'text', date: DateTime.now().toString());
        final initialResponse = await repo.getResponses(id: placeId);
        await repo.addResponse(
            category: collection,
            playsId: placeId,
            newResponse: responseModel,
            userId: userId);
        final finalResponse = await repo.getResponses(id: placeId);
        expect(initialResponse.length, lessThan(finalResponse.length));
        expect(finalResponse.last, responseModel);
      });
      test('проверка правильности внесения изменений в отзыв', () async {
        final initialResponse = await repo.getResponses(id: placeId);
        final responseModel = ResponseModel(
            name: 'name', text: 'text', date: DateTime.now().toString());
        await repo.changeResponse(
            category: collection,
            playsId: placeId,
            newResponse: responseModel,
            userId: userId);
        final finalResponse = await repo.getResponses(id: placeId);
        expect(initialResponse.length, equals(finalResponse.length));
        expect(finalResponse.where((element) => element == responseModel).first,
            isNotEmpty);
      });
      test('проверка правильности удаления отзыва', () async {
        final initialResponse = await repo.getResponses(id: placeId);
        final responseModel = ResponseModel(
            name: 'name', text: 'text', date: DateTime.now().toString());
        await repo.deleteResponse(
            category: collection, playsId: placeId, userId: userId);
        final finalResponse = await repo.getResponses(id: placeId);
        expect(initialResponse.length, greaterThan(finalResponse.length));
        expect(finalResponse.where((element) => element == responseModel).first,
            isEmpty);
      });
    });
    group('response_hive', () {
      final responseModel = ResponseModel(
          name: 'name', text: 'text', date: DateTime.now().toString());
      final generalRepo = GeneralDataRepository();
      Future<List<ResponseModel>> getResponse() async {
        final initialList =
            await generalRepo.getMenualSaveData(category: collection);
        final initialPlace =
            initialList.where((element) => element.id == placeId).first;
        final initialRating = initialPlace.rate;
        return initialRating;
      }

      test('проверка добавления отзыва hive', () async {
        final initialResponse = await getResponse();
        await repo.addSaveResponse(
            category: collection,
            playsId: placeId,
            newResponse: responseModel,
            userId: userId);
        final finalResponses = await getResponse();
        expect(initialResponse.length, lessThan(finalResponses.length));
        expect(finalResponses.last, responseModel);
      });
      test('проверка изменения отзыва hive', () async {
        final initialResponse = await getResponse();
        await repo.changeSaveResponse(
            category: collection,
            playsId: placeId,
            newResponse: responseModel,
            userId: userId);
        final finalResponses = await getResponse();
        expect(initialResponse.length, equals(finalResponses.length));
        expect(
            finalResponses.where((element) => element == responseModel).first,
            isNotEmpty);
      });
      test('проверка удаления отзыва hive', () async {
        final initialResponse = await getResponse();
        await repo.deleteSaveResponse(
            category: collection, playsId: placeId, userId: userId);
        final finalResponses = await getResponse();
        expect(initialResponse.length, greaterThan(finalResponses.length));
        expect(
            finalResponses
                .where((element) => element == responseModel)
                .toList(),
            isEmpty);
      });
    });
  });
  group('search', () {
    // final genRepo = GeneralDataRepository();
    final initialList = MainGeneralModel(
        restourants:
            rest); //await genRepo.getModelData(category: 'restourants');
    //final tags = await genRepo.getTags(category: 'restourants');
    final repo =
        DataSearchRepository(initialList: initialList.restourants, tegs: {});
    test(
        'проверка правильности поисковых результатов при сортировке по рейтингу',
        () {
      expect(
          repo.search(
              activeTags: [], list: initialList.restourants, sort: 'rating'),
          isA<List<BaseGeneralModel>>()
              .having(
                  (x) => x.every((element) =>
                      element.rating.rating >= x.last.rating.rating),
                  'проверка последовательности снизу',
                  true)
              .having(
                  (x) => x.every((element) =>
                      element.rating.rating <= x.first.rating.rating),
                  'проверка последовательности сверху',
                  true));
    });
    test(
        'проверка правильности поисковых результатов при сортировке по времени работы',
        () {
      expect(
          repo.search(
              activeTags: [], list: initialList.restourants, sort: 'opened'),
          isA<List<BaseGeneralModel>>().having(
              (x) => x.every((element) =>
                  element.workTime.workStatus == OpenClosedStatus.open ||
                  element.workTime.workStatus == OpenClosedStatus.almostClosed),
              'проверка статуса работы всех найденных мест',
              true));
    });
    test(
        'проверка правильности поисковых результатов при сортировке по стоимости (от дорогого)',
        () {
      expect(
          repo.search(
              activeTags: [], list: initialList.restourants, sort: 'expensive'),
          isA<List<BaseGeneralModel>>().having(
              (x) => x.every((element) => element.costs <= x.first.costs),
              'проверка порядка от дорогого к дешевому',
              true));
    });
    test(
        'проверка правильности поисковых результатов при сортировке по стоимости (от более доступного)',
        () {
      expect(
          repo.search(
              activeTags: [], list: initialList.restourants, sort: 'cheap'),
          isA<List<BaseGeneralModel>>().having(
              (x) => x.every((element) => element.costs >= x.first.costs),
              'проверка порядка от дешевого к дорогому',
              true));
    });
    test('проверка правильности тэгирования', () {
      final activeTags = ['evropean kitchen', 'my favorite'];
      expect(
          repo.search(
              activeTags: activeTags, list: initialList.restourants, sort: ''),
          isA<List<BaseGeneralModel>>().having(
              (x) => x.every((place) =>
                  activeTags.every((tag) => place.teg.contains(tag))),
              'проверка наличия активного тэга у всех найденных элементов',
              isTrue));
    });
  });

  testWidgets('тестирование добавления виджетов на экране',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApps());
    final findText = find.byType(ElevatedButton);
    expect(findText, findsOneWidget);
    await tester.tap(findText);
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.navigate_next), findsWidgets);
  });
  testWidgets(
      'тестирование одного пробного виджета на недопустимость изменений его конфигурации',
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: WidgetTestExample(),
    ));
    final Finder findContainer = find.byType(Container);
    // expect(findContainer, findsOneWidget);
    expect(findContainer.first, isSameColorAs(Colors.blue));
  });

  test('description', () {
    createone();
    int s = 5;
    expect(s, 5);
  });
}

void createone() {
  create();
  print('hello life');
}

Future<void> create() async {
  print('hello world');
  await create();
  print('hello my life');
}
