import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/reset_backyard_when_day_passed.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

class MockBackyardRepository extends Mock implements BackyardRepository {}

void main(){
  ResetBackyardWhenDayPassed usecase;
  BackyardRepository mockBackyardRepository;
  
  setUp((){

    initializeTimeZones();

    mockBackyardRepository = MockBackyardRepository();
    usecase = ResetBackyardWhenDayPassed(mockBackyardRepository, getLocation("Antarctica/Palmer"));
  });

  test(
    'should call ',
    ()async {
      // arrange
      
      // act
      
      // assert
      
    },
  );

}