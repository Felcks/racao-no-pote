import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:racao_no_pote/app/core/device/location_manager.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:timezone/timezone.dart';
part 'backyard_creation_model.g.dart';

class BackyardCreationModel = _BackyardCreationModelBase
    with _$BackyardCreationModel;

abstract class _BackyardCreationModelBase with Store {
  final defaultLocation = Modular.get<LocationManager>().defaultLocation;

  @observable
  Backyard backyard;

  @observable
  bool isUsingCup;
  @action
  changeIsUsingCup(bool value) => isUsingCup = value;

  @action
  changeName(String value) => backyard.animal.name = value;

  @action
  changeNickName(String value) => backyard.animal.nickname = value;

  @action
  changeBirthday(TZDateTime value) => backyard.animal.birthday = value;

  @action
  changeWeight(String value) => backyard.animal.weight = double.parse(value);

  @action
  changeCupQuantity(String value) {
    int capacity = int.parse(value);

    if (backyard.cup == null)
      backyard.cup = Cup(capacity: capacity);
    else
      backyard.cup.capacity = capacity;
  }

  @action
  changeFoodQuantity(String value) =>
      backyard.food.maxQuantity = int.parse(value);

  @action
  setBackyard(Backyard backyard) {
    this.backyard = backyard;
    this.isUsingCup = this.backyard.cup != null ? true : false;
  }

  _BackyardCreationModelBase() {
    this.backyard = Backyard(
      id: null,
      food: Element(
        quantity: 0,
        maxQuantity: 0,
        incrementDate: TZDateTime.now(defaultLocation),
        updateDate: TZDateTime.now(defaultLocation),
      ),
      water: Element(
        quantity: 0,
        maxQuantity: 0,
        incrementDate: TZDateTime.now(defaultLocation),
        updateDate: TZDateTime.now(defaultLocation),
      ),
      animal: Animal(
          name: "",
          nickname: "",
          birthday: TZDateTime.now(defaultLocation),
          weight: null),
    );

    this.isUsingCup = false;
  }
}
