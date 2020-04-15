import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/backyard.dart';
import '../../domain/entities/element.dart';
import '../../domain/usecases/reset_backyard_when_day_passed.dart';
import '../../domain/usecases/unselect_backyard.dart';
import '../../domain/usecases/update_backyard.dart';
import '../../domain/usecases/view_backyard.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final viewBackyard = Modular.get<ViewBackyard>();
  final unselectBackyard = Modular.get<UnselectBackyard>();
  final resetBackyardWhenDayPassed = Modular.get<ResetBackyardWhenDayPassed>();
  final updatebackyard = Modular.get<UpdateBackyard>();

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
    updatebackyard(Params(backyard: backyard));
  }

  incrementFoodQuantity(double value) {
    this.updateElementQuantity(backyard.food, backyard.food.quantity + value);
  }
}
