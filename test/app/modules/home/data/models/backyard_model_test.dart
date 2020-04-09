import 'dart:convert';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:racao_no_pote/app/modules/home/data/models/backyard_model.dart';
import 'package:racao_no_pote/app/modules/home/data/models/element_model.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  initializeTimeZones();

  final detroit = getLocation('Africa/Abidjan');
  BackyardModel tBackyardModel;
  Backyard tBackyard;
  ElementModel tElementModel;

  setUp(() {
    tElementModel = ElementModel(
        quantity: 0,
        update_date: TZDateTime.parse(detroit, "2020-04-08T09:37:57+0000"),
        increment_date: TZDateTime.parse(detroit, "2020-04-08T05:37:57+0000"));

    tBackyardModel = BackyardModel(
      food: tElementModel,
      water: tElementModel
    );

    tBackyard = Backyard(
      food: ElementModel.fromEntity(tElementModel),
      water: ElementModel.fromEntity(tElementModel)
    );
  });

  test(
    'should be a subclass of Backyard entity',
    () async {
      // assert
      expect(tBackyardModel, isA<Backyard>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when JSON is ok',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('backyard.json'));
        // act
        final result = BackyardModel.fromJson(jsonMap);
        // assert
        expect(result, tBackyardModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // arrange
        // act
        final result = tBackyardModel.toJson();
        // assert
        final Map<String, dynamic> expectedJsonMap =
            json.decode(fixture('backyard.json'));
        expect(result, expectedJsonMap);
      },
    );
  });

   group('fromEntity', () {
    test(
      'should return a Backyard entity containing the proper data',
      () async {
        // arrange
        // act
        final result = BackyardModel.fromEntity(tBackyard);
        // assert
        expect(result, equals(tBackyardModel));
      },
    );
  });
}
