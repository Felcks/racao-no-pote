import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:timezone/timezone.dart';

import '../../../../../core/device/location_manager.dart';
import '../../../domain/entities/backyard.dart';
import '../../../domain/usecases/create_backyard.dart';
import '../../../domain/usecases/update_backyard.dart';
import 'backyard_creation_model.dart';

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
    if (model.backyard.animal.name == null ||
        model.backyard.animal.name.isEmpty) {
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
  }
}
