
import 'package:flutter_test/flutter_test.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';

Cup getCupInstance(){
  return Cup(capacity: 50);
}

void main(){

  Cup cup;

  setUp((){
    cup = getCupInstance();
  });

  test(
    'should return correct capacity text when filled',
    ()async {
      // arrange
      final expected = "50 gramas";
      // act
      final result = cup.getCapacityText();
      // assert
      expect(result, expected);
    },
  );
}