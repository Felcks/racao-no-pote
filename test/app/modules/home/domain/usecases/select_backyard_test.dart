import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/select_backyard.dart';

class MockBackyardRepository extends Mock implements BackyardRepository {}
class MockBackyard extends Mock implements Backyard {}

void main(){
  SelectBackyard usecase;
  BackyardRepository mockBackyardRepository;
  Backyard tBackyard;

  setUp((){
    mockBackyardRepository = MockBackyardRepository();
    usecase = SelectBackyard(mockBackyardRepository);
    tBackyard = MockBackyard();
  });

  test(
    'should call cacheBackyard to the repository',
    ()async {
      // arrange
      when(mockBackyardRepository.cacheBackyard(any)).thenAnswer((_) async => Right(true));
      // act
      final result = await usecase(SelectBackyardParams(backyard: tBackyard));
      // assert
      verify(mockBackyardRepository.cacheBackyard(tBackyard));
      expect(result, Right(true));
      verifyNoMoreInteractions(mockBackyardRepository);
    },
  );
}