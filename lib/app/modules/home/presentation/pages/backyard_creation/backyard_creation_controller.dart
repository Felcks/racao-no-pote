import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/usecases/create_backyard.dart';
import 'backyard_presentation.dart';

part 'backyard_creation_controller.g.dart';

class BackyardCreationController = _BackyardCreationControllerBase
    with _$BackyardCreationController;

abstract class _BackyardCreationControllerBase with Store {
  var backyard = BackyardPresentation();
  final createBackyard = Modular.get<CreateBackyard>();
  DateTime birthday;

  @observable
  bool showErrors = false;

  @computed
  bool get isValid {
    return validateName() == null &&
        validateNickName() == null &&
        validateWeight() == null &&
        validateBirthday() == null &&
        validateCup() == null &&
        validateFoodQuantity() == null;
  }

  Future<bool> creatingBackyard() async {
    final result = await createBackyard(
      BackyardParams(
        name: backyard.name,
        nickName: backyard.nickname,
        birthday: this.birthday,
        weight: backyard.weight != null ? double.parse(backyard.weight) : null,
        capacity: backyard.cupQuantity != null
            ? int.parse(backyard.cupQuantity)
            : null,
        maxFoodQuantity: backyard.foodQuantity != null
            ? int.parse(backyard.foodQuantity)
            : null,
      ),
    );

    return result.isRight();
  }

  String validateName() {
    if (backyard.name == null || backyard.name.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }

  String validateNickName() {
    return null;
  }

  String validateWeight() {
    return null;
  }

  String validateBirthday() {
    if (backyard.birthday == null || backyard.birthday.isEmpty)
      return "Campo obrigatório";

    return null;
  }

  String validateCup() {
    if (backyard.isUsingCup) {
      if (backyard.cupQuantity == null || backyard.cupQuantity.isEmpty)
        return "Campo obrigatório";
    }

    return null;
  }

  String validateFoodQuantity() {
    if (backyard.foodQuantity == null || backyard.foodQuantity.isEmpty) {
      return "Campo obrigatório";
    }

    return null;
  }

  void confirmDateTime(DateTime date) {
    this.birthday = date;
    backyard.changeBirthday('${date.day}/${date.month}/${date.year}');
  }
}
