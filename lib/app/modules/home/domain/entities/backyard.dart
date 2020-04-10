import 'package:equatable/equatable.dart';

import 'cup.dart';
import 'element.dart';

class Backyard extends Equatable {
  final Element food;
  final Element water;
  final Cup cup;

  Backyard({this.food, this.water, this.cup}) : super([food, water, cup]);
}
