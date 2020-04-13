import 'animal_model.dart';
import 'cup_model.dart';
import 'package:racao_no_pote/app/modules/home/data/models/element_model.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';

import '../../domain/entities/backyard.dart';
import 'package:meta/meta.dart';

class BackyardModel extends Backyard {
  BackyardModel(
      {@required ElementModel food,
      @required ElementModel water,
      @required AnimalModel animal,
      CupModel cup})
      : super(food: food, water: water, animal: animal, cup: cup);

  factory BackyardModel.fromJson(Map<String, dynamic> json) {
    return BackyardModel(
      food: ElementModel.fromJson(json['food']),
      water: ElementModel.fromJson(json['water']),
      animal: AnimalModel.fromJson(json['animal']),
      cup: json['cup'] != null ? CupModel.fromJson(json['cup']) : null,
    );
  }

  factory BackyardModel.fromEntity(Backyard backyard) {
    
    CupModel cupModel;
    if(backyard.cup != null)
      cupModel = CupModel.fromEntity(backyard.cup);
    else
      cupModel = null;

    return BackyardModel(
      food: ElementModel.fromEntity(backyard.food),
      water: ElementModel.fromEntity(backyard.water),
      animal: AnimalModel.fromEntity(backyard.animal),
      cup: cupModel,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "food": (food as ElementModel).toJson(),
      "water": (water as ElementModel).toJson(),
      "animal": (animal as AnimalModel).toJson(),
      "cup": (cup as CupModel)?.toJson()
    };
  }
}
