import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/core/network/network_info.dart';
import 'package:racao_no_pote/app/modules/home/data/data_sources/backyard_local_data_source.dart';
import 'package:racao_no_pote/app/modules/home/data/data_sources/backyard_remote_data_source.dart';
import 'package:racao_no_pote/app/modules/home/data/models/animal_model.dart';
import 'package:racao_no_pote/app/modules/home/data/models/backyard_model.dart';
import 'package:racao_no_pote/app/modules/home/data/models/element_model.dart';
import 'package:racao_no_pote/app/modules/home/data/repositories/backyard_repository_impl.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/core/error/exception.dart';
import 'package:racao_no_pote/app/core/error/failure.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

class MockLocalDataSource extends Mock implements BackyardLocalDataSource {}

class MockRemoteDataSource extends Mock implements BackyardRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  BackyardLocalDataSource mockLocalDataSource;
  BackyardRemoteDataSource mockRemoteDataSource;
  NetworkInfo networkInfo;
  BackyardRepository repository;

  BackyardModel tBackyardModel;
  Backyard tBackyard;
  ElementModel tElementModel;
  Element tElement;
  AnimalModel tAnimalModel;
  Animal tAnimal;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    networkInfo = MockNetworkInfo();
    repository = BackyardRepositoryImpl(
        localDataSource: mockLocalDataSource,
        remoteDataSource: mockRemoteDataSource,
        networkInfo: networkInfo);

    initializeTimeZones();
    final detroit = getLocation('Africa/Abidjan');
    tElementModel = ElementModel(
        quantity: 0,
        max_quantity: 210,
        update_date: TZDateTime.parse(detroit, "2020-04-08T09:37:57+0000"),
        increment_date: TZDateTime.parse(detroit, "2020-04-08T05:37:57+0000"));
    tElement = tElementModel;

    tAnimalModel = AnimalModel(
        name: "Pandora",
        weight: 10.4,
        birthday: TZDateTime.parse(detroit, "2020-04-08T09:37:57+0000"));
    tAnimal = tAnimalModel;

    tBackyardModel = BackyardModel(
        id: 1, food: tElementModel, water: tElementModel, animal: tAnimalModel);
    tBackyard = tBackyardModel;
  });

  test(
    'should check if the device is online',
    () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getCachedBackyard();
      // assert
      verify(networkInfo.isConnected);
    },
  );

  test(
    'should check if the device is online when get BackyardList',
    () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getBackyardList();
      // assert
      verify(networkInfo.isConnected);
    },
  );

  group('device is offline', () {
    setUp(() {
      when(networkInfo.isConnected).thenAnswer((_) async => false);
    });

    test(
      'should return last locally data cached when the cached data is present',
      () async {
        // arrange
        when(mockLocalDataSource.getCachedBackyardID())
            .thenAnswer((_) async => 1);
        when(mockLocalDataSource.getBackyardList())
            .thenAnswer((_) async => [tBackyard]);
        // act
        final result = await repository.getCachedBackyard();
        // assert
        expect(result, equals(Right(tBackyard)));
        verify(mockLocalDataSource.getBackyardList());
        verify(mockLocalDataSource.getCachedBackyardID());
        verifyZeroInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should throw CacheFailure when the cached data is not present',
      () async {
        // arrange
        when(mockLocalDataSource.getCachedBackyardID()).thenThrow(CacheException());
        // act
        final result = await repository.getCachedBackyard();
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCachedBackyardID());
        expect(result, equals(Left(CacheFailure())));
      },
    );

    // test(
    //   'should call cacheBackyard when updateBackyard',
    //   () async {
    //     // act
    //     final result = await repository.updateBackyard(tBackyard);
    //     // assert
    //     verifyNoMoreInteractions(mockRemoteDataSource);
    //     verify(mockLocalDataSource.cacheBackyard(tBackyard));
    //   },
    // );

    test(
      'should return list of backyard when cache data is present',
      () async {
        // arrange
        final List<BackyardModel> expected = [tBackyard];
        when(mockLocalDataSource.getBackyardList())
            .thenAnswer((_) async => expected);
        // act
        final result = await repository.getBackyardList();
        // assert
        expect(result, equals(Right(expected)));
        verify(mockLocalDataSource.getBackyardList());
        verifyZeroInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should throw CacheFailure when the cached data is not present on backyard List',
      () async {
        // arrange
        when(mockLocalDataSource.getBackyardList()).thenThrow(CacheException());
        // act
        final result = await repository.getBackyardList();
        // assert
        expect(result, equals(Left(CacheFailure())));
        verify(mockLocalDataSource.getBackyardList());
        verifyZeroInteractions(mockRemoteDataSource);
      },
    );

    // group('create backyard', () {
    //   test(
    //     'should return backyard when create is successful',
    //     () async {
    //       // arrange
    //       when(mockLocalDataSource.cacheBackyard(tBackyardModel))
    //           .thenAnswer((_) async => tBackyardModel);
    //       // act
    //       final result = await repository.createBackyard(tBackyardModel);
    //       // assert
    //       expect(result, Right(tBackyardModel));
    //       verify(mockLocalDataSource.cacheBackyard(tBackyardModel));
    //     },
    //   );

    //   test(
    //     'should throw AlreadyCreatedFailure when dataSource throws AlreadyCreatedException',
    //     () async {
    //       // arrange
    //       when(mockLocalDataSource.cacheBackyard(tBackyardModel))
    //           .thenThrow(AlreadyCreatedException());
    //       // act
    //       final result = await repository.createBackyard(tBackyardModel);
    //       // assert
    //       expect(result, Left(AlreadyCreatedFailure()));
    //     },
    //   );
    // });
  });
}
