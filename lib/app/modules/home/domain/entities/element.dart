import 'package:equatable/equatable.dart';
import 'package:timezone/timezone.dart';
import 'package:meta/meta.dart';

class Element extends Equatable {
  int quantity;
  int maxQuantity;
  TZDateTime updateDate;
  TZDateTime incrementDate;

  Element(
      {@required this.quantity,
      @required this.maxQuantity,
      @required this.updateDate,
      @required this.incrementDate})
      : super([quantity, maxQuantity, updateDate.toIso8601String(), incrementDate.toIso8601String()]);

  String getUpdateDateFormatted(Location location) {
    final date = TZDateTime.parse(location, this.updateDate.toIso8601String());
    return "Atualizado às ${date.hour}:${date.minute}";
  }

   String getIncrementDateFormatted(Location location) {
    final date = TZDateTime.parse(location, this.incrementDate.toIso8601String());
     return "Adicionado às ${date.hour}:${date.minute}";
  }

  String getQuantityText(){
    return "$quantity/$maxQuantity g";
  }
}
