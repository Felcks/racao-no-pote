import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/unselect_backyard.dart';
import 'package:racao_no_pote/app/core/usecases/usecase.dart';

class MockBackyardRepository extends Mock implements BackyardRepository {}

void main(){
  UnselectBackyard usecase;
  BackyardRepository mockBackyardRepository;

  setUp((){
    mockBackyardRepository = MockBackyardRepository();
    usecase = UnselectBackyard(mockBackyardRepository);
  });

  test(
    'should call save last backyard from the repository',
    ()async {
      // arrange
      when(mockBackyardRepository.cacheBackyard(any)).thenAnswer((_) async => Right(true));
      // act
      final result = await usecase(NoParams());
      // assert
      verify(mockBackyardRepository.cacheBackyard(null));
      expect(result, Right(true));
      verifyNoMoreInteractions(mockBackyardRepository);
    },
  );
}