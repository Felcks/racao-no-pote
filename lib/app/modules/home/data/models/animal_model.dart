import 'dart:convert';

import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:meta/meta.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/location.dart';
import 'package:timezone/timezone.dart';

class AnimalModel extends Animal{

  AnimalModel({
    @required String name,
    String nickname,
    @required TZDateTime birthday,
    double weight
  }): super(name: name, nickname: nickname, birthday: birthday, weight: weight);

  factory AnimalModel.fromJson(Map<String, dynamic> json) {
    return AnimalModel(
      name: json['name'],
      nickname: json['nickname'],
      birthday: TZDateTime.parse(getGMTLocation(), json['birthday']),
      weight: json['weight']
    );
  }

  factory AnimalModel.fromEntity(Animal entity) {
    return AnimalModel(
      name: entity.name,
      nickname: entity.nickname,
      birthday: entity.birthday,
      weight: entity.weight,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "nickname": this.nickname,
      "birthday": this.birthday.toIso8601String(),
      "weight": this.weight,
    };
  }
}