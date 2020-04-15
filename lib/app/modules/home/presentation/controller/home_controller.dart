import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

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

  @observable
  Backyard backyard;

  _HomeControllerBase() {
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
