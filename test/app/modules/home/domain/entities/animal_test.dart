import 'package:flutter_test/flutter_test.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest.dart';

void main() {
  Animal tAnimalComplete;
  Animal tAnimalRequired;
  Animal tAnimalSevenMonths;
  Animal tAnimalOneYearAndThreeMonths;
  Animal tAnimalFourYears;

  setUp(() {
    initializeTimeZones();
    final location = getLocation('Africa/Abidjan');
    tAnimalComplete = Animal(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime.now(location),
        weight: 10.4);

    tAnimalRequired = Animal(
      name: "Pandora",
      birthday: TZDateTime.now(location),
    );

    tAnimalSevenMonths = Animal(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime.now(location).subtract(
            Duration(days: 220)), //the right is 210 but 220 be cerntain right
        weight: 10.4);

    tAnimalOneYearAndThreeMonths = Animal(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime.now(location).subtract(
            Duration(days: 465)), //the right is 455 but 465 to be certain right
        weight: 10.4);

    tAnimalFourYears = Animal(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime.now(location).subtract(Duration(
            days: 1470)), //the right is 1461 but 1470 to be certain right
        weight: 10.4);
  });

  test(
    'should be different class when compare complete and required',
    () async {
      // arrange
      // act
      // assert
      expect(tAnimalComplete, isNot(equals(tAnimalRequired)));
    },
  );

  test(
    'should get proper map of attributes when completely filled',
    () async {
      // arrange
      Map<String, String> attributes = {
        "Nome": "Pandora",
        "Apelido": "Malucão",
        "Idade": "0 dias",
        "Peso": "10.4 Kg"
      };
      // act
      final result = tAnimalComplete.getAttributes();
      // assert
      expect(result, attributes);
    },
  );

  test(
    'should get proper map of attributes when not completely filled',
    () async {
      // arrange
      Map<String, String> attributes = {
        "Nome": "Pandora",
        "Apelido": "-",
        "Idade": "0 dias",
        "Peso": "-"
      };
      // act
      final result = tAnimalRequired.getAttributes();
      // assert
      expect(result, attributes);
    },
  );

  test(
    'should get proper map of attributes when has months of life',
    () async {
      // arrange
      Map<String, String> attributes = {
        "Nome": "Pandora",
        "Apelido": "Malucão",
        "Idade": "7 meses",
        "Peso": "10.4 Kg"
      };
      // act
      final result = tAnimalSevenMonths.getAttributes();
      // assert
      expect(result, attributes);
    },
  );

  test(
    'should get proper map of attributes when has one year and months of life',
    () async {
      // arrange
      Map<String, String> attributes = {
        "Nome": "Pandora",
        "Apelido": "Malucão",
        "Idade": "1 ano e 3 meses",
        "Peso": "10.4 Kg"
      };
      // act
      final result = tAnimalOneYearAndThreeMonths.getAttributes();
      // assert
      expect(result, attributes);
    },
  );

  test(
    'should get proper map of attributes when has years of life',
    () async {
      // arrange
      Map<String, String> attributes = {
        "Nome": "Pandora",
        "Apelido": "Malucão",
        "Idade": "4 anos",
        "Peso": "10.4 Kg"
      };
      // act
      final result = tAnimalFourYears.getAttributes();
      // assert
      expect(result, attributes);
    },
  );

  test(
    'should get correct weight text when filled',
    () async {
      // arrange
      final expected = "10.4 Kg";
      // act
      final result = tAnimalComplete.getWeight();
      // assert
      expect(result, expected);
    },
  );

  test(
    'should get correct empty text when not filled',
    () async {
      // arrange
      final expected = "-";
      // act
      final result = tAnimalRequired.getWeight();
      // assert
      expect(result, expected);
    },
  );
}
