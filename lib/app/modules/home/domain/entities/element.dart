import 'package:equatable/equatable.dart';
import 'package:timezone/timezone.dart';
import 'package:meta/meta.dart';

class Element extends Equatable {
  int quantity;
  TZDateTime updateDate;
  TZDateTime incrementDate;

  Element(
      {@required this.quantity,
      @required this.updateDate,
      @required this.incrementDate})
      : super([quantity, updateDate.toIso8601String(), incrementDate.toIso8601String()]);

  String get updateDateFormatted {
    final location = getLocation("America/Sao_Paulo");
    final date = TZDateTime.parse(location, this.updateDate.toIso8601String());
    return "Atualizado às ${date.hour}:${date.minute}";
  }

   String get incrementDateFormatted {
    final location = getLocation("America/Sao_Paulo");
    final date = TZDateTime.parse(location, this.incrementDate.toIso8601String());
     return "Adicionado às ${date.hour}:${date.minute}";
  }
}
