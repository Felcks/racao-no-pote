import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/update_current_backyard.dart';
import 'package:timezone/timezone.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/backyard.dart';
import '../../domain/usecases/get_current_backyard.dart';
import '../../domain/usecases/update_current_backyard.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final getCurrentBackyard = Modular.get<GetCurrentBackyard>();
  final updateCurrentBackyard = Modular.get<UpdateCurrentBackyard>();

  @observable
  Backyard backyard;

  @observable
  bool newBackyard = false;

  _HomeControllerBase() {
    fetchBackyard();
  }

  @action
  fetchBackyard() async {
    final result = await getCurrentBackyard(NoParams());
    backyard = result.fold((failure) {
      newBackyard = true;
      print(result);
      return null;
    }, (backyard) => this.backyard = backyard);
  }

  @action
  createBackyard() async {
    final location = getLocation("Africa/Abidjan");
    Element food = Element(
        quantity: 0,
        incrementDate: TZDateTime.now(location),
        updateDate: TZDateTime.now(location));
    Element water = food;

    final mBackyard = Backyard(food: food, water: water);
    await updateCurrentBackyard(Params(backyard: mBackyard));
    fetchBackyard();
  }

  @action
  updateBackyard() async {
    await updateCurrentBackyard(Params(backyard: backyard));
    fetchBackyard();
  }

  @action
  updateElementQuantity(Element element, double value){
    element.quantity = value.toInt();
  }

  incrementFoodQuantity(double value){
    this.updateElementQuantity(backyard.food, backyard.food.quantity + value);
  }
}
