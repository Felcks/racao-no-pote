import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:racao_no_pote/app/core/device/location_manager.dart';
import 'package:timezone/timezone.dart';

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
  final _viewBackyardUseCase = Modular.get<ViewBackyard>();
  final _unselectBackyardUseCase = Modular.get<UnselectBackyard>();
  final _resetBackyardWhenDayPassedUseCase =
      Modular.get<ResetBackyardWhenDayPassed>();
  final _updateBackyardUseCase = Modular.get<UpdateBackyard>();
  final _defaultLocation = Modular.get<LocationManager>().defaultLocation;

  @observable
  Backyard backyard;

  _HomeControllerBase() {
    fetchBackyard();
  }

  @action
  _checkBackyard(Backyard backyard) async {
    final result = await _resetBackyardWhenDayPassedUseCase(
        ResetBackyardWhenDayPassedParams(backyard));

    // this.backyard = await result.fold((failure) {
    //   print("Failure ${backyard.animal.name}");
    //   return backyard;
    // }, (value) {
    //   print("SUCCESS ${value.animal.name}");
    //   return value;
    // });

    this.backyard = result.getOrElse(() => backyard);
  }

  @action
  fetchBackyard() async {
    final result = await _viewBackyardUseCase(NoParams());

    result.fold((failure) {
      return null;
    }, (backyard) {
      _checkBackyard(backyard);
    });
  }

  @action
  unselectBackyard() async {
    final result = await _unselectBackyardUseCase(NoParams());
    return result.isRight();
  }

  @action
  updateElementQuantity(Element element, double value) {
    element.quantity = value.toInt();
    _updateBackyardUseCase(UpdateBackyardParams(backyard: backyard));
  }

  incrementFoodQuantity(double value) {
    this.updateElementQuantity(backyard.food, backyard.food.quantity + value);
  }

  TZDateTime get currentDate => TZDateTime.now(_defaultLocation);

  Location get currentLocation => _defaultLocation;
}
