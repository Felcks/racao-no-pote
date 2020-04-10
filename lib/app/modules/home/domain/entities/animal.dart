import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:timezone/timezone.dart';

class Animal {
  String name;
  String nickname;
  TZDateTime birthday;
  double weight;

  Animal(
      {@required this.name,
      this.nickname,
      @required this.birthday,
      this.weight});

  Map<String, String> getAttributes() {
    return {
      "Nome": this.name,
      "Apelido": this.nickname ?? "-",
      "Idade": getAge(),
      "Peso": getWeight()
    };
  }

  String getWeight() {
    if (this.weight == null) return "-";

    return "${this.weight} Kg";
  }

  String getAge() {
    String timeUnit = "dias";
    final location = getLocation('Africa/Abidjan');
    int difference = TZDateTime.now(location).difference(birthday).inDays;

    if (difference > 730) {
      difference = difference ~/ 365;
      timeUnit = "anos";
    } else if (difference > 365) {
      return "${difference ~/ 365} ano e ${(difference % 365) ~/ 30} meses";
    } else if (difference > 30) {
      difference = difference ~/ 30;
      timeUnit = "meses";
    }
    
    return "$difference $timeUnit";
  }
}
