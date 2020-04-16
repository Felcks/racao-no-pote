import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:timezone/timezone.dart';

import '../../../../../core/device/location_manager.dart';
import '../../../domain/entities/animal.dart';
import '../../../domain/entities/backyard.dart';
import '../../../domain/entities/cup.dart';
import '../../../domain/entities/element.dart';
import '../../../domain/usecases/create_backyard.dart';
import 'backyard_presentation.dart';

part 'backyard_creation_controller.g.dart';

class BackyardCreationController = _BackyardCreationControllerBase
    with _$BackyardCreationController;

abstract class _BackyardCreationControllerBase with Store {
  final backyard = BackyardPresentation();
  final createBackyard = Modular.get<CreateBackyard>();
  final defaultLocation = Modular.get<LocationManager>().defaultLocation;

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
    final mBackyard = Backyard(
      id: null,
      food: Element(
        quantity: 0,
        maxQuantity: int.parse(backyard.foodQuantity),
        incrementDate: TZDateTime.now(defaultLocation),
        updateDate: TZDateTime.now(defaultLocation),
      ),
      water: Element(
        quantity: 0,
        maxQuantity: int.parse(backyard.foodQuantity),
        incrementDate: TZDateTime.now(defaultLocation),
        updateDate: TZDateTime.now(defaultLocation),
      ),
      cup: backyard.cupQuantity != null
          ? Cup(capacity: int.parse(backyard.cupQuantity))
          : null,
      animal: Animal(
          name: backyard.name,
          nickname: backyard.nickname,
          birthday: TZDateTime.from(this.birthday, defaultLocation),
          weight: double.parse(backyard.weight)),
    );

    final result = await createBackyard(Params(backyard: mBackyard));

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
