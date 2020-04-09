import 'dart:convert';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:racao_no_pote/app/modules/home/data/models/element_model.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  initializeTimeZones();

  final detroit = getLocation('Africa/Abidjan');
  ElementModel tElementModel;
  Element tElement;

  setUp(() {
    tElementModel = ElementModel(
      quantity: 0,
      update_date: TZDateTime.parse(detroit, "2020-04-08T09:37:57+0000"),
      increment_date: TZDateTime.parse(detroit, "2020-04-08T05:37:57+0000"),
    );

    tElement = Element(
      quantity: 0,
      updateDate: TZDateTime.parse(detroit, "2020-04-08T09:37:57+0000"),
      incrementDate: TZDateTime.parse(detroit, "2020-04-08T05:37:57+0000"),
    );
  });

  test(
    'should be a subclass of Element entity',
    () async {
      // assert
      expect(tElementModel, isA<Element>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when JSON is ok',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('element.json'));
        // act
        final result = ElementModel.fromJson(jsonMap);
        // assert
        expect(result, tElementModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // arrange
        // act
        final result = tElementModel.toJson();
        // assert
        final Map<String, dynamic> expectedJsonMap =
            json.decode(fixture('element.json'));
        expect(result, expectedJsonMap);
      },
    );
  });

  group('fromEntity', () {
    test(
      'should return a Element entity containing the proper data',
      () async {
        // arrange
        // act
        final result = ElementModel.fromEntity(tElement);
        // assert
        expect(result, equals(tElementModel));
      },
    );
  });
}
