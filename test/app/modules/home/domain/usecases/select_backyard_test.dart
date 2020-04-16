import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/select_backyard.dart';

class MockBackyardRepository extends Mock implements BackyardRepository {}

void main(){
  SelectBackyard usecase;
  BackyardRepository mockBackyardRepository;

  setUp((){
    mockBackyardRepository = MockBackyardRepository();
    usecase = SelectBackyard(mockBackyardRepository);
  });

  test(
    'should call save last backyard from the repository',
    ()async {
      // arrange
      when(mockBackyardRepository.saveLastBackyard(any)).thenAnswer((_) async => Right(true));
      // act
      final result = await usecase(Params(id: 1));
      // assert
      verify(mockBackyardRepository.saveLastBackyard(1));
      expect(result, Right(true));
      verifyNoMoreInteractions(mockBackyardRepository);
    },
  );
}