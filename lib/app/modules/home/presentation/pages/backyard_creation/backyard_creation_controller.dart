import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest.dart';

import '../../../domain/usecases/create_backyard.dart';
import 'backyard_presentation.dart';

part 'backyard_creation_controller.g.dart';

class BackyardCreationController = _BackyardCreationControllerBase
    with _$BackyardCreationController;

abstract class _BackyardCreationControllerBase with Store {
  var backyard = BackyardPresentation();
  final createBackyard = Modular.get<CreateBackyard>();
  DateTime birthday;

  String validateName() {
    if (backyard.name == null || backyard.name.isEmpty) {
      return "Campo obrigatório";
    } else if (backyard.name.length < 3) {
      return "Campo precisa de 3 characteres";
    }

    return null;
  }

  String validateNickName() {
    return null;
  }

  String validateWeight() {
    if (backyard.weight == null || backyard.weight.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }

  String validateBirthday() {
    return null;
  }

  String validateCup() {
    if (backyard.isUsingCup) {
      if (backyard.cupQuantity == null || backyard.cupQuantity.isEmpty)
        return "Campo obrigatório";
    }

    return null;
  }

  void confirmDateTime(DateTime date) {
    this.birthday = date;
    backyard.changeBirthday('${date.day}/${date.month}/${date.year}');
  }

  @computed
  bool get isValid {
    return validateName() == null &&
        validateNickName() == null &&
        validateWeight() == null &&
        validateBirthday() == null &&
        validateCup() == null;
  }

  void creatingBackyard() async {
    initializeTimeZones();
    final location = getLocation("Africa/Abidjan");
    final result = await createBackyard(
      BackyardParams(
        name: backyard.name,
        nickName: backyard.nickname,
        birthday: TZDateTime.from(this.birthday, location),
        weight: double.parse(backyard.weight),
        capacity: backyard.cupQuantity != null ? int.parse(backyard.cupQuantity) : null,
      ),
    );

    result.fold((failure) {
      print("Fail");
    }, (success) {
      print("sucess");
    });
  }
}