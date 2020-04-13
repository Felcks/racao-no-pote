import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'animal.dart';
import 'cup.dart';
import 'element.dart';

class Backyard extends Equatable {
  int id;
  final Element food;
  final Element water;
  final Animal animal;
  Cup cup;

  Backyard(
      {@required this.id,
      @required this.food,
      @required this.water,
      @required this.animal,
      this.cup})
      : super([id, food, water, animal, cup]);
}
