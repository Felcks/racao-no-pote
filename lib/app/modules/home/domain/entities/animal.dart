import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:timezone/timezone.dart';

class Animal extends Equatable {
  String name;
  String nickname;
  TZDateTime birthday;
  double weight;

  Animal(
      {@required this.name,
      this.nickname,
      @required this.birthday,
      this.weight})
      : super([name, nickname, birthday.toIso8601String(), weight]);

  Map<String, String> getAttributes(TZDateTime currentDate, Location location) {
    return {
      "Nome": this.name,
      "Apelido": this.nickname ?? "-",
      "Idade": getAge(currentDate, location),
      "Peso": getWeight()
    };
  }

  String getWeight() {
    if (this.weight == null) return "-";

    return "${this.weight} Kg";
  }

  String getAge(TZDateTime currentDate, Location location) {
    String timeUnit = "dias";
    int difference = currentDate.difference(birthday).inDays;

    if (currentDate.isAfter(TZDateTime(
        location, birthday.year + 2, birthday.month, birthday.day))) {
      difference = currentDate.year - birthday.year;
      timeUnit = "anos";
    } else if (currentDate.isAfter(TZDateTime(
        location, birthday.year + 1, birthday.month, birthday.day))) {
      difference = currentDate.year - birthday.year;
      timeUnit = "ano";

      if (currentDate.isAfter(TZDateTime(
          location, birthday.year + 1, birthday.month + 1, birthday.day))) {
        int monthDiffAmount = 0;
        for (int i = 1; i < 12; i++) {
          if (currentDate.isAfter(TZDateTime(
              location, birthday.year + 1, birthday.month + i, birthday.day))) {
            monthDiffAmount += 1;
          } else {
            break;
          }
        }

        return "1 ano e $monthDiffAmount meses";
      }
    } else if (currentDate.isAfter(TZDateTime(
        location, birthday.year, birthday.month + 1, birthday.day))) {
      int monthDiffAmount = 0;
      for (int i = 1; i < 12; i++) {
        if (currentDate.isAfter(TZDateTime(
            location, birthday.year, birthday.month + i, birthday.day))) {
          monthDiffAmount += 1;
        } else {
          break;
        }
      }

      if (monthDiffAmount > 1)
        return "$monthDiffAmount meses";
      else
        return "1 mês";
    }

    return "$difference $timeUnit";
  }
}
