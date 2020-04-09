import 'package:equatable/equatable.dart';

import 'element.dart';

class Backyard extends Equatable {
  final Element food;
  final Element water;

  Backyard({this.food, this.water}) : super([food, water]);
}
