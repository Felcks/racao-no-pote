import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/update_current_backyard.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

class MockBackyardRepository extends Mock implements BackyardRepository {}

void main() {
  UpdateCurrentBackyard usecase;
  BackyardRepository backyardRepository;

  setUp(() {
    backyardRepository = MockBackyardRepository();
    usecase = UpdateCurrentBackyard(backyardRepository);
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
  final Backyard tBackyard = Backyard(food: tFood, water: tWater);

  test(
    'should call repository',
    () async {
      // arrange
      when(backyardRepository.updateBackyard(any))
          .thenAnswer((_) async => Right(tBackyard));
      // act
      final result = await usecase(Params(backyard: tBackyard));
      // assert
      expect(result, equals(Right(tBackyard)));
      verify(backyardRepository.updateBackyard(tBackyard));
      verifyNoMoreInteractions(backyardRepository);
    },
  );
}
