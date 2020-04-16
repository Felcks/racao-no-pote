import 'package:flutter_test/flutter_test.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest.dart';

void main() {
  Animal tAnimalComplete;
  Animal tAnimalRequired;
  Animal tAnimalStartOfYear;
  Animal tAnimalEndOfYear;

  initializeTimeZones();
  final location = getLocation('Africa/Abidjan');

  setUp(() {
    TZDateTime nowDateTime = TZDateTime.now(location);

    tAnimalComplete = Animal(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime.now(location),
        weight: 10.4);

    tAnimalRequired = Animal(
      name: "Pandora",
      birthday: TZDateTime.now(location),
    );

    tAnimalStartOfYear = Animal(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime(location, 2012, 01, 01),
        weight: 10.4);

    tAnimalEndOfYear = Animal(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime(location, 2012, 12, 01),
        weight: 10.4);
  });

  test(
    'should be different class when compare complete and others',
    () async {
      // assert
      expect(tAnimalComplete, isNot(equals(tAnimalRequired)));
      expect(tAnimalComplete, isNot(equals(tAnimalStartOfYear)));
      expect(tAnimalComplete, isNot(equals(tAnimalEndOfYear)));
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
      final result =
          tAnimalComplete.getAttributes(TZDateTime.now(location), location);
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
      final result =
          tAnimalRequired.getAttributes(TZDateTime.now(location), location);
      // assert
      expect(result, attributes);
    },
  );

  group('getAge', () {
    group('birth on start of year', () {
      test(
        'should get proper age when has one month of life',
        () async {
          // arrange
          Map<String, String> attributes = {
            "Nome": "Pandora",
            "Apelido": "Malucão",
            "Idade": "1 mês",
            "Peso": "10.4 Kg"
          };
          // act
          final result = tAnimalStartOfYear.getAttributes(
              TZDateTime(location, 2012, 02, 01, 2), location);
          // assert
          expect(result, attributes);
        },
      );


      test(
        'should get proper age when has months of life',
        () async {
          // arrange
          Map<String, String> attributes = {
            "Nome": "Pandora",
            "Apelido": "Malucão",
            "Idade": "7 meses",
            "Peso": "10.4 Kg"
          };
          // act
          final result = tAnimalStartOfYear.getAttributes(
              TZDateTime(location, 2012, 08, 01, 2), location);
          // assert
          expect(result, attributes);
        },
      );


      test(
        'should get proper age when has one year and zero months of life',
        () async {
          // arrange
          Map<String, String> attributes = {
            "Nome": "Pandora",
            "Apelido": "Malucão",
            "Idade": "1 ano",
            "Peso": "10.4 Kg"
          };
          // act
          final result = tAnimalStartOfYear.getAttributes(
              TZDateTime(location, 2013, 01, 01, 2), location);
          // assert
          expect(result, attributes);
        },
      );

      test(
        'should get proper age when has one year and months of life',
        () async {
          // arrange
          Map<String, String> attributes = {
            "Nome": "Pandora",
            "Apelido": "Malucão",
            "Idade": "1 ano e 3 meses",
            "Peso": "10.4 Kg"
          };
          // act
          final result = tAnimalStartOfYear.getAttributes(
              TZDateTime(location, 2013, 04, 01, 2), location);
          // assert
          expect(result, attributes);
        },
      );

      test(
        'should get proper age when has almost one year',
        () async {
          // arrange
          Map<String, String> attributes = {
            "Nome": "Pandora",
            "Apelido": "Malucão",
            "Idade": "11 meses",
            "Peso": "10.4 Kg"
          };
          // act
          final result = tAnimalStartOfYear.getAttributes(
              TZDateTime(location, 2012, 12, 31, 23), location);
          // assert
          expect(result, attributes);
        },
      );

      test(
        'should get proper age when has years of life',
        () async {
          // arrange
          Map<String, String> attributes = {
            "Nome": "Pandora",
            "Apelido": "Malucão",
            "Idade": "4 anos",
            "Peso": "10.4 Kg"
          };
          // act
          final result = tAnimalStartOfYear.getAttributes(
              TZDateTime(location, 2016, 01, 01, 02), location);
          // assert
          expect(result, attributes);
        },
      );
    });

    group('birth on end of year', () {
      test(
        'should get proper age when has one month of life',
        () async {
          // arrange
          Map<String, String> attributes = {
            "Nome": "Pandora",
            "Apelido": "Malucão",
            "Idade": "1 mês",
            "Peso": "10.4 Kg"
          };
          // act
          final result = tAnimalEndOfYear.getAttributes(
              TZDateTime(location, 2013, 01, 01, 2), location);
          // assert
          expect(result, attributes);
        },
      );


      test(
        'should get proper age when has months of life',
        () async {
          // arrange
          Map<String, String> attributes = {
            "Nome": "Pandora",
            "Apelido": "Malucão",
            "Idade": "7 meses",
            "Peso": "10.4 Kg"
          };
          // act
          final result = tAnimalEndOfYear.getAttributes(
              TZDateTime(location, 2013, 07, 01, 2), location);
          // assert
          expect(result, attributes);
        },
      );


      test(
        'should get proper age when has one year and zero months of life',
        () async {
          // arrange
          Map<String, String> attributes = {
            "Nome": "Pandora",
            "Apelido": "Malucão",
            "Idade": "1 ano",
            "Peso": "10.4 Kg"
          };
          // act
          final result = tAnimalEndOfYear.getAttributes(
              TZDateTime(location, 2013, 12, 01, 2), location);
          // assert
          expect(result, attributes);
        },
      );

      test(
        'should get proper age when has one year and months of life',
        () async {
          // arrange
          Map<String, String> attributes = {
            "Nome": "Pandora",
            "Apelido": "Malucão",
            "Idade": "1 ano e 3 meses",
            "Peso": "10.4 Kg"
          };
          // act
          final result = tAnimalEndOfYear.getAttributes(
              TZDateTime(location, 2014, 03, 01, 2), location);
          // assert
          expect(result, attributes);
        },
      );

      test(
        'should get proper age when has almost one year',
        () async {
          // arrange
          Map<String, String> attributes = {
            "Nome": "Pandora",
            "Apelido": "Malucão",
            "Idade": "11 meses",
            "Peso": "10.4 Kg"
          };
          // act
          final result = tAnimalEndOfYear.getAttributes(
              TZDateTime(location, 2013, 11, 30, 23), location);
          // assert
          expect(result, attributes);
        },
      );

      test(
        'should get proper age when has years of life',
        () async {
          // arrange
          Map<String, String> attributes = {
            "Nome": "Pandora",
            "Apelido": "Malucão",
            "Idade": "4 anos",
            "Peso": "10.4 Kg"
          };
          // act
          final result = tAnimalEndOfYear.getAttributes(
              TZDateTime(location, 2016, 12, 01, 02), location);
          // assert
          expect(result, attributes);
        },
      );
    });
  });

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
