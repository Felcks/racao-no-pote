import 'package:flutter_test/flutter_test.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

void main() {
  initializeTimeZones();
  final defaultLocation = getLocation('Europe/London');
  final userLocation = getLocation('Antarctica/Palmer');

  Element tElement;
  Element tElementStartOfDay;

  setUp(() {
    tElement = Element(
        quantity: 100,
        maxQuantity: 100,
        updateDate: TZDateTime(defaultLocation, 2012, 01, 01, 05, 30),
        incrementDate: TZDateTime(defaultLocation, 2012, 01, 01, 05, 30));

    tElementStartOfDay = Element(
        quantity: 100,
        maxQuantity: 100,
        updateDate: TZDateTime(defaultLocation, 2012, 01, 01, 01, 30),
        incrementDate: TZDateTime(defaultLocation, 2012, 01, 01, 01, 30));
  });

  group('element with normal hour', () {
    test(
      'should get proper update/increment string when location is GMT',
      () async {
        // arrange
        // act
        final resultUpdateDate =
            tElement.getUpdateDateFormatted(defaultLocation);
        final resultIncrementDate =
            tElement.getIncrementDateFormatted(defaultLocation);
        // assert
        expect(resultUpdateDate, "Atualizado às 5:30");
        expect(resultIncrementDate, "Adicionado às 5:30");
      },
    );

    test(
      'should get proper update/increment string when location differ from GMT',
      () async {
        // arrange
        // act
        final resultUpdateDate = tElement.getUpdateDateFormatted(userLocation);
        final resultIncrementDate =
            tElement.getIncrementDateFormatted(userLocation);
        // assert
        expect(resultUpdateDate, "Atualizado às 2:30");
        expect(resultIncrementDate, "Adicionado às 2:30");
      },
    );
  });

  group('element with differ day hour', () {


    test(
      'should get proper update/increment string when location is GMT',
      () async {
        // arrange
        // act
        final resultUpdateDate =
            tElementStartOfDay.getUpdateDateFormatted(defaultLocation);
        final resultIncrementDate =
            tElementStartOfDay.getIncrementDateFormatted(defaultLocation);
        // assert
        expect(resultUpdateDate, "Atualizado às 1:30");
        expect(resultIncrementDate, "Adicionado às 1:30");
      },
    );

    test(
      'should get proper update/increment string when location differ from GMT',
      () async {
        // arrange
        // act
        final resultUpdateDate = tElementStartOfDay.getUpdateDateFormatted(userLocation);
        final resultIncrementDate =
            tElementStartOfDay.getIncrementDateFormatted(userLocation);
        // assert
        expect(resultUpdateDate, "Atualizado às 22:30");
        expect(resultIncrementDate, "Adicionado às 22:30");
      },
    );
  });
}
