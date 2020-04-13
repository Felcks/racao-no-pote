import 'dart:convert';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:racao_no_pote/app/modules/home/data/models/animal_model.dart';
import 'package:racao_no_pote/app/modules/home/data/models/backyard_model.dart';
import 'package:racao_no_pote/app/modules/home/data/models/cup_model.dart';
import 'package:racao_no_pote/app/modules/home/data/models/element_model.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';
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
  AnimalModel tAnimalModel;
  CupModel tCupModel;

   BackyardModel tBackyardModelWithoutCup;
   BackyardModel tBackyardWithoutCup;

  setUp(() {
    tElementModel = ElementModel(
        quantity: 0,
        update_date: TZDateTime.parse(detroit, "2020-04-08T09:37:57+0000"),
        increment_date: TZDateTime.parse(detroit, "2020-04-08T05:37:57+0000"));

    tCupModel = CupModel(capacity: 50);

    tAnimalModel = AnimalModel(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime.parse(detroit, "2020-04-08T09:37:57+0000"),
        weight: 10.4);

    tBackyardModel = BackyardModel(
        food: tElementModel,
        water: tElementModel,
        animal: tAnimalModel,
        cup: tCupModel);

    tBackyard = tBackyardModel;

    tBackyardModelWithoutCup = BackyardModel(
       food: tElementModel,
        water: tElementModel,
        animal: tAnimalModel
    );
    tBackyardWithoutCup = tBackyardModelWithoutCup;

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

    test(
      'should return a valid model when JSON has no cup',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('backyard_without_cup.json'));
        // act
        final result = BackyardModel.fromJson(jsonMap);
        // assert
        expect(result, tBackyardModelWithoutCup);
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

     test(
      'should return a JSON map containing the proper data without cup',
      () async {
        // arrange
        // act
        final result = tBackyardModelWithoutCup.toJson();
        // assert
        final Map<String, dynamic> expectedJsonMap =
            json.decode(fixture('backyard_without_cup.json'));
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
