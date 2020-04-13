import 'package:mobx/mobx.dart';
import 'package:racao_no_pote/app/modules/home/presentation/pages/backyard_creation/backyard_presentation.dart';

part 'backyard_creation_controller.g.dart';

class BackyardCreationController = _BackyardCreationControllerBase
    with _$BackyardCreationController;

abstract class _BackyardCreationControllerBase with Store {
  var backyard = BackyardPresentation();

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
    if (backyard.isUsingCup){ 
      if (backyard.cupQuantity == null || backyard.cupQuantity.isEmpty) return "Campo obrigatório";
    }

    return null;
  }

  void confirmDateTime(DateTime date) {
    backyard.changeBirthday('${date.year} - ${date.month} - ${date.day}');
  }

  @computed
  bool get isValid {
    return validateName() == null &&
        validateNickName() == null &&
        validateWeight() == null &&
        validateBirthday() == null &&
        validateCup() == null;
  }
}
