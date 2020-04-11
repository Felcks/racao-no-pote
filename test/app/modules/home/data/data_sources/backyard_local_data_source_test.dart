import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/data/data_sources/backyard_local_data_source.dart';
import 'package:racao_no_pote/app/modules/home/data/models/animal_model.dart';
import 'package:racao_no_pote/app/modules/home/data/models/backyard_model.dart';
import 'package:racao_no_pote/app/modules/home/data/models/cup_model.dart';
import 'package:racao_no_pote/app/modules/home/data/models/element_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';
import 'package:racao_no_pote/app/core/error/exception.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  SharedPreferences mockSharedPreferences;
  BackyardLocalDataSource localDataSource;

  initializeTimeZones();
  final detroit = getLocation('Africa/Abidjan');
  BackyardModel tBackyardModel;
  ElementModel tElementModel;
  AnimalModel tAnimalModel;
  CupModel tCupModel;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataSource =
        BackyardLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);

    tElementModel = ElementModel(
        quantity: 0,
        update_date: TZDateTime.parse(detroit, "2020-04-08T09:37:57+0000"),
        increment_date: TZDateTime.parse(detroit, "2020-04-08T05:37:57+0000"));

    tCupModel = CupModel(capacity: 50);

    tAnimalModel = AnimalModel(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime.parse(detroit, "2020-04-08T09:37:57+0000"),
        weight: 10.4);

    tBackyardModel = BackyardModel(
        food: tElementModel,
        water: tElementModel,
        animal: tAnimalModel,
        cup: tCupModel);
  });

  test(
    'should return Backyard from SharedPreferences when there is one in the cache',
    () async {
      // arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('backyard.json'));
      // act
      final result = await localDataSource.getLastBackyard();
      // assert
      verify(mockSharedPreferences.getString(CACHED_BACKYARD));
      expect(result, equals(tBackyardModel));
    },
  );

  test(
    'should return CacheException when there is no cache',
    () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      // act
      final call = localDataSource.getLastBackyard;
      // assert
      expect(() => call(), throwsA(isA<CacheException>()));
    },
  );

  test(
    'should call SharedPreferences to cache the data',
    () async {
      // act
      localDataSource.cacheBackyard(tBackyardModel);
      // assert
      final expectedJsonString = json.encode(tBackyardModel.toJson());
      verify(
          mockSharedPreferences.setString(CACHED_BACKYARD, expectedJsonString));
    },
  );

  test(
    'should return Backyard List from SharedPreferences when there is one or more in cache',
    () async {
      // arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('backyard_list.json'));
      // act
      final result = await localDataSource.getBackyardList();
      // assert
      verify(mockSharedPreferences.getString(CACHED_BACKYARD_LIST));
      expect(result, equals([tBackyardModel]));
    },
  );

  test(
    'should return CacheException when there is no cache of BackyardList',
    () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      // act
      final call = localDataSource.getBackyardList;
      // assert
      expect(() => call(), throwsA(isA<CacheException>()));
    },
  );
}
