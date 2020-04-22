import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/view_backyard.dart';
import 'package:racao_no_pote/app/core/usecases/usecase.dart';

class MockBackyardRepository extends Mock implements BackyardRepository {}

class MockBackyard extends Mock implements Backyard {}

void main() {
  ViewBackyard usecase;
  BackyardRepository backyardRepository;
  Backyard tBackyard;

  setUp(() {
    backyardRepository = MockBackyardRepository();
    usecase = ViewBackyard(backyardRepository);
    tBackyard = MockBackyard();
  });

  test(
    'should return backyard selected from the repository',
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
