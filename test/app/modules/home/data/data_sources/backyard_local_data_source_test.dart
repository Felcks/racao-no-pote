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
  BackyardModel tBackyardModelWithoutID;
  ElementModel tElementModel;
  AnimalModel tAnimalModel;
  CupModel tCupModel;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataSource =
        BackyardLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);

    tElementModel = ElementModel(
        quantity: 0,
        max_quantity: 210,
        update_date: TZDateTime.parse(detroit, "2020-04-08T09:37:57+0000"),
        increment_date: TZDateTime.parse(detroit, "2020-04-08T05:37:57+0000"));

    tCupModel = CupModel(capacity: 50);

    tAnimalModel = AnimalModel(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime.parse(detroit, "2020-04-08T09:37:57+0000"),
        weight: 10.4);

    tBackyardModel = BackyardModel(
        id: 1,
        food: tElementModel,
        water: tElementModel,
        animal: tAnimalModel,
        cup: tCupModel);

    tBackyardModelWithoutID = BackyardModel(
        id: null,
        food: tElementModel,
        water: tElementModel,
        animal: tAnimalModel,
        cup: tCupModel);
  });

  group('getBackyardList', () {
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
  });

  group('cacheBackyardID', () {
    test(
      'should call SharedPreferences to cache the data',
      () async {
        // arrange
        final tExpectedID = 2;
        when(mockSharedPreferences.setInt(any, any))
            .thenAnswer((_) async => true);
        // act
        final result = await localDataSource.cacheBackyardID(tExpectedID);
        // assert
        verify(mockSharedPreferences.setInt(CACHED_BACKYARD, tExpectedID));
        expect(result, true);
      },
    );

    test(
      'should return true when cache was successful',
      () async {
        // arrange
        final tExpectedID = 2;
        when(mockSharedPreferences.setInt(any, any))
            .thenAnswer((_) async => true);
        // act
        final result = await localDataSource.cacheBackyardID(tExpectedID);
        // assert
        expect(result, true);
        verify(mockSharedPreferences.setInt(CACHED_BACKYARD, tExpectedID));
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should return false when unsuccessful',
      () async {
        // arrange
        final tExpectedID = 2;
        when(mockSharedPreferences.setInt(any, any))
            .thenAnswer((_) async => false);
        // act
        final result = await localDataSource.cacheBackyardID(tExpectedID);
        // assert
        expect(result, false);
        verify(mockSharedPreferences.setInt(CACHED_BACKYARD, tExpectedID));
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    group('getCachedBackyardID', () {
      test(
        'should return BackyardID from SharedPreferences when there is one in the cache',
        () async {
          // arrange
          when(mockSharedPreferences.getInt(any)).thenReturn(1);
          // act
          final result = await localDataSource.getCachedBackyardID();
          // assert
          verify(mockSharedPreferences.getInt(CACHED_BACKYARD));
          expect(result, 1);
        },
      );

      test(
        'should return CacheException when there is no cachedBackyardID',
        () async {
          // arrange
          when(mockSharedPreferences.getInt(any)).thenReturn(null);
          // act
          final call = localDataSource.getCachedBackyardID;
          // assert
          expect(() => call(), throwsA(isA<CacheException>()));
        },
      );
    });
  });
}
