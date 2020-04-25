import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:racao_no_pote/app/core/device/location_manager.dart';
import 'package:timezone/timezone.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/backyard.dart';
import '../../domain/entities/element.dart';
import '../../domain/usecases/reset_backyard_when_day_passed.dart';
import '../../domain/usecases/unselect_backyard.dart' as mUnselectBackyard;
import '../../domain/usecases/update_backyard.dart' as mUpdateBackyard;
import '../../domain/usecases/view_backyard.dart' as mViewBackyard;

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final viewBackyard = Modular.get<mViewBackyard.ViewBackyard>();
  final unselectBackyard = Modular.get<mUnselectBackyard.UnselectBackyard>();
  final resetBackyardWhenDayPassed = Modular.get<ResetBackyardWhenDayPassed>();
  final updatebackyard = Modular.get<mUpdateBackyard.UpdateBackyard>();
  final _defaultLocation = Modular.get<LocationManager>().defaultLocation;

  @observable
  Backyard backyard;

  _HomeControllerBase(){
    fetchBackyard();
  }

  _checkBackyard() async {
    final result = await resetBackyardWhenDayPassed(Params(backyard.id));
    result.fold((failure) {}, (value) {
      // if (value) fetchBackyard();
      return value;
    });
  }

  @action
  fetchBackyard() async {
    final result = await viewBackyard(NoParams());

    backyard = result.fold((failure) {
      return null;
    }, (backyard) {
      //_checkBackyard();
      this.backyard = backyard;
      return this.backyard;
    });
  }

  @action
  unselectMyBackyard() async {
    final result = await unselectBackyard(NoParams());
    return result.isRight();
  }

  @action
  updateElementQuantity(Element element, double value) {
    element.quantity = value.toInt();
    //updatebackyard(Params(backyard: backyard));
  }

  incrementFoodQuantity(double value) {
    this.updateElementQuantity(backyard.food, backyard.food.quantity + value);
  }

  TZDateTime get currentDate => TZDateTime.now(_defaultLocation);

  Location get currentLocation => _defaultLocation;
}
