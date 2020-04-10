import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:racao_no_pote/app/modules/home/data/models/animal_model.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  AnimalModel tAnimalModel;
  Animal tAnimal;

  setUp(() {
    initializeTimeZones();
    final location = getLocation('Africa/Abidjan');
    
    tAnimalModel = AnimalModel(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime.parse(location, "2020-04-08T09:37:57.000+0000"),
        weight: 10.4);

    tAnimal = Animal(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime.parse(location, "2020-04-08T09:37:57.000+0000"),
        weight: 10.4);
  });

  test(
    'should be a subclass of Animal entity',
    () async {
      // assert
      expect(tAnimalModel, isA<Animal>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when JSON is ok',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('animal.json'));
        // act
        final result = AnimalModel.fromJson(jsonMap);
        print(result.getAttributes());
        print(tAnimalModel.getAttributes());
        // assert
        expect(result, equals(tAnimalModel));
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // arrange
        // act
        final result = tAnimalModel.toJson();
        // assert
        final Map<String, dynamic> expectedJsonMap =
            json.decode(fixture('animal.json'));
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
        final result = AnimalModel.fromEntity(tAnimal);
        // assert
        expect(result, equals(tAnimalModel));
      },
    );
  });
}
