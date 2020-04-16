import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/create_backyard.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

class MockBackyardRepository extends Mock implements BackyardRepository {}

void main() {
  CreateBackyard usecase;
  BackyardRepository backyardRepository;
  Location location;

  initializeTimeZones();
  location = getLocation("Africa/Abidjan");

  setUp(() {
    backyardRepository = MockBackyardRepository();
    usecase = CreateBackyard(backyardRepository, location);
  });

  final Element tFood = Element(
      quantity: 0,
      maxQuantity: 210,
      updateDate: TZDateTime.now(location),
      incrementDate: TZDateTime.now(location));
  final Element tWater = Element(
      quantity: 0,
      maxQuantity: 210,
      updateDate: TZDateTime.now(location),
      incrementDate: TZDateTime.now(location));

  Cup tCup = Cup(capacity: 50);

  Animal tAnimal = Animal(
      name: "Pandora",
      birthday: TZDateTime.parse(location, "2020-04-08T09:37:57+0000"),
      weight: 10.4);

  final Backyard tBackyard = Backyard(
      id: null, food: tFood, water: tWater, animal: tAnimal, cup: tCup);

  test(
    'should call repository with correct params',
    () async {
      // arrange
      when(backyardRepository.createBackyard(any))
          .thenAnswer((_) async => Right(tBackyard));
      // act
      final result = await usecase(BackyardParams(
        name: "Pandora",
        maxFoodQuantity: 210,
        birthday: TZDateTime.parse(location, "2020-04-08T09:37:57+0000"),
      ));
      // assert
      Backyard backyardResult;
      result.fold((failure) {}, (value) {
        backyardResult = value;
      });
      expect(backyardResult.animal.name, tBackyard.animal.name);
      expect(backyardResult.animal.birthday, tBackyard.animal.birthday);
      expect(backyardResult.food.maxQuantity, tBackyard.food.maxQuantity);
      verify(backyardRepository.createBackyard(any));
      verifyNoMoreInteractions(backyardRepository);
    },
  );
}
