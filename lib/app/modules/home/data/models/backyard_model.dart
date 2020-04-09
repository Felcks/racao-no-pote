import 'package:racao_no_pote/app/modules/home/data/models/element_model.dart';

import '../../domain/entities/backyard.dart';
import 'package:meta/meta.dart';

class BackyardModel extends Backyard {
  BackyardModel({
    @required ElementModel food,
    @required ElementModel water,
  }) : super(food: food, water: water);

  factory BackyardModel.fromJson(Map<String, dynamic> json) {
    return BackyardModel(
        food: ElementModel.fromJson(json['food']),
        water: ElementModel.fromJson(json['water']));
  }

  factory BackyardModel.fromEntity(Backyard backyard) {
    return BackyardModel(
      food: ElementModel.fromEntity(backyard.food),
      water: ElementModel.fromEntity(backyard.water),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "food": (food as ElementModel).toJson(),
      "water": (water as ElementModel).toJson()
    };
  }
}
