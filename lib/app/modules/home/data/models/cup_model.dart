import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';
import 'package:meta/meta.dart';

class CupModel extends Cup {
  CupModel({@required int capacity}) : super(capacity: capacity);

  factory CupModel.fromJson(Map<String, dynamic> json) {
    return CupModel(capacity: json['capacity']);
  }

  factory CupModel.fromEntity(Cup entity) {
    return CupModel(
      capacity: entity.capacity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "capacity": this.capacity
    };
  }
}
