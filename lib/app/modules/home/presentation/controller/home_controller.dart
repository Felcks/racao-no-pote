import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/backyard.dart';
import '../../domain/entities/element.dart';
import '../../domain/usecases/create_backyard.dart';
import '../../domain/usecases/update_backyard.dart';
import '../../domain/usecases/view_backyard.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final getCurrentBackyard = Modular.get<ViewBackyard>();
  final createBackyardUseCase = Modular.get<CreateBackyard>();

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
      return null;
    }, (backyard) => this.backyard = backyard);
  }

  @action
  createBackyard() async {
    // await createBackyardUseCase(BackyardParams());
    // fetchBackyard();
  }

  @action
  updateBackyard() async {
    //await updateCurrentBackyard(Params(backyard: backyard));
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
