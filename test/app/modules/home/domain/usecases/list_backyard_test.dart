import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/list_backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/core/usecases/usecase.dart';

class MockBackyardRepository extends Mock implements BackyardRepository {}
class MockBackyard extends Mock implements Backyard {}

void main() {
  ListBackyard usecase;
  BackyardRepository mockBackyardRepository;
  Backyard tBackyard;

  setUp(() {
    mockBackyardRepository = MockBackyardRepository();
    usecase = ListBackyard(mockBackyardRepository);
    tBackyard = MockBackyard();
  });

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
