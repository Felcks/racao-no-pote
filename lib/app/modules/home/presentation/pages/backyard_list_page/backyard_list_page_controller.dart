import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/update_current_backyard.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/backyard.dart';
import '../../../domain/usecases/get_backyard_list.dart';

part 'backyard_list_page_controller.g.dart';

class BackyardListPageController = _BackyardListPageControllerBase
    with _$BackyardListPageController;

abstract class _BackyardListPageControllerBase with Store {
  final getBackyardList = Modular.get<GetBackyardList>();
  final updateCurrentBackyard = Modular.get<UpdateCurrentBackyard>();

  @observable
  ObservableList<Backyard> backyardList;

  _BackyardListPageControllerBase() {
    fetchBackyardList();
  }

   @action
  updateBackyard(Backyard backyard) async {
    await updateCurrentBackyard(Params(backyard: backyard));
  }

  @action
  fetchBackyardList() async {
    final result = await getBackyardList(NoParams());
    backyardList = result.fold((failure) {
      List<Backyard> emptyList = [];
      return emptyList.asObservable();
    }, (backyardList) => this.backyardList = backyardList.asObservable());
  }
}
