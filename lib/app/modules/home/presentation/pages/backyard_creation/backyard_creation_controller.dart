import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:racao_no_pote/app/modules/home/presentation/pages/backyard_creation/backyard_creation_model.dart';
import 'package:timezone/timezone.dart';

import '../../../../../core/device/location_manager.dart';
import '../../../domain/entities/backyard.dart';
import '../../../domain/usecases/create_backyard.dart';
import '../../../domain/usecases/update_backyard.dart';

part 'backyard_creation_controller.g.dart';

class BackyardCreationController = _BackyardCreationControllerBase
    with _$BackyardCreationController;

abstract class _BackyardCreationControllerBase with Store {
  final _createBackyard = Modular.get<CreateBackyard>();
  final _updateBackyard = Modular.get<UpdateBackyard>();
  final defaultLocation = Modular.get<LocationManager>().defaultLocation;
  final model = BackyardCreationModel();

  @observable
  bool showErrors = false;

  bool get isValid {
    return validateName() == null &&
        validateNickName() == null &&
        validateWeight() == null &&
        validateBirthday() == null &&
        validateCup() == null &&
        validateFoodQuantity() == null;
  }

  Future<bool> createOrUpdateBackyard(int id) async {
    final result = id == null
        ? await _createBackyard(CreateBackyardParams(backyard: model.backyard))
        : await _updateBackyard(UpdateBackyardParams(backyard: model.backyard));

    return result.isRight();
  }

  String validateName() {
    if (model.backyard.animal.name == null || model.backyard.animal.name.isEmpty) {
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
    if (model.backyard.animal.birthday == null) return "Campo obrigatório";

    return null;
  }

  String validateCup() {
    return null;
  }

  String validateFoodQuantity() {
    if (model.backyard.food.maxQuantity == null) {
      return "Campo obrigatório";
    }

    return null;
  }

  void confirmDateTime(DateTime date) {
    model.changeBirthday(TZDateTime.from(date, defaultLocation));
  }

  @action
  void setPresentationBackyard(Backyard backyard) {
    model.setBackyard(backyard);
    // if (backyard != null) {
    //   this.backyard.changeName(backyard.animal.name);
    //   this.backyard.changeNickName(backyard.animal.nickname);
    //   this.backyard.changeWeight(backyard.animal.weight != null
    //       ? backyard.animal.weight.toString()
    //       : "");
    //   this.backyard.changeBirthday(backyard.animal.birthday);

    //   this.backyard.changeFoodQuantity(backyard.food.maxQuantity.toString());

    //   this.backyard.changeIsUsingCup(backyard.cup != null ? true : false);
    //   this.backyard.changeCupQuantity(
    //       backyard.cup != null ? backyard.cup.capacity.toString() : "");
    // }
  }
}
