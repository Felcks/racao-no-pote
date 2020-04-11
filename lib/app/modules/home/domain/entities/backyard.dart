import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'animal.dart';
import 'cup.dart';
import 'element.dart';

class Backyard extends Equatable {
  final Element food;
  final Element water;
  final Animal animal;
  Cup cup;

  Backyard(
      {@required this.food,
      @required this.water,
      @required this.animal,
      this.cup})
      : super([food, water, animal, cup]);
}
