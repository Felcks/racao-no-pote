import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/list_backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:racao_no_pote/app/core/usecases/usecase.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

class MockBackyardRepository extends Mock implements BackyardRepository {}

void main() {
  ListBackyard usecase;
  BackyardRepository mockBackyardRepository;
  Location location;

  initializeTimeZones();
  location = getLocation("Africa/Abidjan");

  setUp(() {
    mockBackyardRepository = MockBackyardRepository();
    usecase = ListBackyard(mockBackyardRepository);
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
      nickname: "Malucão",
      birthday: TZDateTime.parse(location, "2020-04-08T09:37:57+0000"),
      weight: 10.4);

  final Backyard tBackyard =
      Backyard(id: 1, food: tFood, water: tWater, animal: tAnimal, cup: tCup);

  test(
    'should return backyard list from the repository',
    () async {
      // arrange
      List<Backyard> expected = [tBackyard];
      when(mockBackyardRepository.getBackyardList())
          .thenAnswer((_) async => Right(expected));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(expected));
      verify(mockBackyardRepository.getBackyardList());
      verifyNoMoreInteractions(mockBackyardRepository);
    },
  );
}
