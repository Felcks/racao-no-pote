import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Cup extends Equatable{
  int capacity;

  Cup({@required this.capacity}): super([capacity]);

  String getCapacityText(){
    return "$capacity gramas";
  }

  String getHalfCapacityText(){
     return "${(capacity/2)} gramas";
  }
}