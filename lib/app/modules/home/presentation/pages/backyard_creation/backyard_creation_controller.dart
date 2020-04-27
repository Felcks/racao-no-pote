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
  final _createBackyard = Modular.get<CreateBackyard>();
  final defaultLocation = Modular.get<LocationManager>().defaultLocation;

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
          birthday: TZDateTime.from(backyard.birthday, defaultLocation),
          weight:
              backyard.weight != null ? double.parse(backyard.weight) : null),
    );

    final result = await _createBackyard(CreateBackyardParams(backyard: mBackyard));

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
    if (backyard.birthday == null)
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
    backyard.changeBirthday(date);
  }

  @action
  void setPresentationBackyard(Backyard backyard){
    
    //  if(backyard != null){
    //     this.backyard.changeName(backyard.animal.name);
    //     this.backyard.changeNickName(backyard.animal.nickname);
    //     this.backyard.changeWeight(backyard.animal.weight != null ? backyard.animal.weight.toString() : 0);
        
    //     //this.backyard.changeBirthday(backyard.animal.birthday);

    //     this.backyard.changeFoodQuantity(backyard.food.maxQuantity.toString());

    //     this.backyard.changeCupQuantity(backyard.cup != null )

    //   // editingControllerNickName.text = (widget.backyard.animal.nickname != null ? widget.backyard.animal.nickname : "");
    //   // editingControllerWeight.text = (widget.backyard.animal.weight != null ? widget.backyard.animal.weight : "");
    //   // editingControllerBirthday.text = (widget.backyard.animal.weight != null ? wid`get.backyard.animal.weight : "");
    //   // // controller.backyard.changeBirthday(widget.backyard.);
      
    //   // controller.backyard.changeIsUsingCup(widget.backyard.cup != null);
    //   // editingControllerCupQuantity.text = (widget.backyard.cup != null ? widget.backyard.cup.capacity : "");

    //   // editingControllerFoodQuantity.text = (widget.backyard.food.maxQuantity.toString());
    //   }
    
  }
}
