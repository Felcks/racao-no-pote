import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/update_backyard.dart';

class MockBackyardRepository extends Mock implements BackyardRepository {}

class MockBackyard extends Mock implements Backyard {}

void main() {
  UpdateBackyard usecase;
  BackyardRepository backyardRepository;
  Backyard tBackyard;

  setUp(() {
    backyardRepository = MockBackyardRepository();
    usecase = UpdateBackyard(backyardRepository);
    tBackyard = MockBackyard();
  });

  test(
    'should call repository',
    () async {
      // arrange
      when(backyardRepository.updateBackyard(any))
          .thenAnswer((_) async => Right(tBackyard));
      // act
      final result = await usecase(UpdateBackyardParams(backyard: tBackyard));
      // assert
      expect(result, equals(Right(tBackyard)));
      verify(backyardRepository.updateBackyard(tBackyard));
      verifyNoMoreInteractions(backyardRepository);
    },
  );
}
