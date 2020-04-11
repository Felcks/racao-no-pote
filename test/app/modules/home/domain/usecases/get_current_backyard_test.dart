import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/get_current_backyard.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';
import 'package:racao_no_pote/app/core/usecases/usecase.dart';

class MockBackyardRepository extends Mock implements BackyardRepository {}

void main() {
  GetCurrentBackyard usecase;
  BackyardRepository backyardRepository;

  setUp(() {
    backyardRepository = MockBackyardRepository();
    usecase = GetCurrentBackyard(backyardRepository);
  });

  initializeTimeZones();

  final detroit = getLocation('America/Detroit');
  final Element tFood = Element(
      quantity: 0,
      updateDate: TZDateTime.now(detroit),
      incrementDate: TZDateTime.now(detroit));
  final Element tWater = Element(
      quantity: 0,
      updateDate: TZDateTime.now(detroit),
      incrementDate: TZDateTime.now(detroit));

  Cup tCup = Cup(capacity: 50);

  Animal tAnimal = Animal(
      name: "Pandora",
      nickname: "Malucão",
      birthday: TZDateTime.parse(detroit, "2020-04-08T09:37:57+0000"),
      weight: 10.4);

  final Backyard tBackyard =
      Backyard(food: tFood, water: tWater, animal: tAnimal, cup: tCup);

  test(
    'should return backyard from the repository',
    () async {
      // arrange
      when(backyardRepository.getBackyard())
          .thenAnswer((_) async => Right(tBackyard));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(tBackyard));
      verify(backyardRepository.getBackyard());
      verifyNoMoreInteractions(backyardRepository);
    },
  );
}
