import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/create_backyard.dart';

class MockBackyardRepository extends Mock implements BackyardRepository {}

class MockBackyard extends Mock implements Backyard {}

void main() {
  CreateBackyard usecase;
  BackyardRepository backyardRepository;
  Backyard tBackyard;

  setUp(() {
    backyardRepository = MockBackyardRepository();
    usecase = CreateBackyard(backyardRepository);
    tBackyard = MockBackyard();
  });

  test(
    'should call repository with correct params',
    () async {
      // arrange
      when(backyardRepository.createBackyard(any))
          .thenAnswer((_) async => Right(tBackyard));
      // act
      final result = await usecase(CreateBackyardParams(backyard: tBackyard));
      // assert
      expect(result,  Right(tBackyard));
      verify(backyardRepository.createBackyard(tBackyard));
      verifyNoMoreInteractions(backyardRepository);
    },
  );
}
