import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:racao_no_pote/app/modules/home/data/models/cup_model.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';
import 'package:timezone/data/latest.dart';
import '../../../../fixtures/fixture_reader.dart';
import '../../domain/entities/cup_test.dart';

CupModel getCupModelInstance(){
  return CupModel(capacity: 50);
}

void main() {
  initializeTimeZones();

  CupModel tCupModel;
  Cup tCup;

  setUp(() {
    tCupModel = getCupModelInstance();
    tCup = getCupInstance();

  });

  test(
    'should be a subclass of Cup entity',
    () async {
      // assert
      expect(tCupModel, isA<Cup>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when JSON is ok',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('cup.json'));
        // act
        final result = CupModel.fromJson(jsonMap);
        // assert
        expect(result, tCupModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // arrange
        // act
        final result = tCupModel.toJson();
        // assert
        final Map<String, dynamic> expectedJsonMap =
            json.decode(fixture('cup.json'));
        expect(result, expectedJsonMap);
      },
    );
  });

  group('fromEntity', () {
    test(
      'should return a Cup entity containing the proper data',
      () async {
        // arrange
        // act
        final result = CupModel.fromEntity(tCup);
        // assert
        expect(result, equals(tCupModel));
      },
    );
  });
}
