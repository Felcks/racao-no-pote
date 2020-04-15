import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/reset_backyard_when_day_passed.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/backyard.dart';
import '../../domain/entities/element.dart';
import '../../domain/usecases/unselect_backyard.dart';
import '../../domain/usecases/view_backyard.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final viewBackyard = Modular.get<ViewBackyard>();
  final unselectBackyard = Modular.get<UnselectBackyard>();
  final resetBackyardWhenDayPassed = Modular.get<ResetBackyardWhenDayPassed>();

  @observable
  Backyard backyard;

  _HomeControllerBase() {
    checkBackyard();
  }

  checkBackyard() async {
    await resetBackyardWhenDayPassed(NoParams());
    fetchBackyard();
  }

  @action
  fetchBackyard() async {
    final result = await viewBackyard(NoParams());

    backyard = result.fold((failure) {
      return null;
    }, (backyard) => this.backyard = backyard);
  }

  @action
  unselectMyBackyard() async {
    final result = await unselectBackyard(NoParams());
    return result.isRight();
  }

  @action
  updateElementQuantity(Element element, double value) {
    element.quantity = value.toInt();
  }

  incrementFoodQuantity(double value) {
    this.updateElementQuantity(backyard.food, backyard.food.quantity + value);
  }
}
