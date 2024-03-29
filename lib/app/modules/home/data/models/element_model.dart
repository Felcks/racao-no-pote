import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';
import 'package:meta/meta.dart';

class ElementModel extends Element {
  ElementModel(
      {@required int quantity,
      @required int max_quantity,
      @required TZDateTime update_date,
      @required TZDateTime increment_date})
      : super(
            quantity: quantity,
            maxQuantity: max_quantity,
            updateDate: update_date,
            incrementDate: increment_date);

  factory ElementModel.fromJson(Map<String, dynamic> json) {
    initializeTimeZones();
    final gmt = getLocation('Africa/Abidjan');
    return ElementModel(
      quantity: json['quantity'],
      max_quantity: json['max_quantity'],
      update_date: TZDateTime.parse(gmt, json['update_date']),
      increment_date: TZDateTime.parse(gmt, json['increment_date']),
    );
  }

  factory ElementModel.fromEntity(Element element){
    return ElementModel(
      quantity: element.quantity,
      max_quantity: element.maxQuantity,
      update_date: element.updateDate,
      increment_date: element.incrementDate
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "quantity": quantity,
      "max_quantity": maxQuantity,
      "update_date": updateDate.toIso8601String(),
      "increment_date": incrementDate.toIso8601String()
    };
  }
}
