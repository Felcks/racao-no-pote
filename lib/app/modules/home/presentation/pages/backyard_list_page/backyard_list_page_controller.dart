import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/view_backyard.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/backyard.dart';
import '../../../domain/usecases/list_backyard.dart';
import '../../../domain/usecases/select_backyard.dart';

part 'backyard_list_page_controller.g.dart';

class BackyardListPageController = _BackyardListPageControllerBase
    with _$BackyardListPageController;

abstract class _BackyardListPageControllerBase with Store {
  final listBackyard = Modular.get<ListBackyard>();
  final selectBackyard = Modular.get<SelectBackyard>();
  final viewBackyard = Modular.get<ViewBackyard>();

  @observable
  ObservableList<Backyard> backyardList;

  @observable
  bool hasSelectedBackyard = true;

  @action
  fetchBackyardList() async {
    final result = await listBackyard(NoParams());
    backyardList = result.fold((failure) {
      List<Backyard> emptyList = [];
      return emptyList.asObservable();
    }, (backyardList) => this.backyardList = backyardList.asObservable());
  }

  @action
  Future<bool> chooseBackyard(int id) async {
    //final result = await selectBackyard(Params(id: id));
    //return result.isRight();
  }

  @action
  checkHasSelectedBackyard() async {
    // final result = await viewBackyard(NoParams());
    // if(result.isRight()){
    //   hasSelectedBackyard = true;
    // } else{
    //   hasSelectedBackyard = false;
    // }
  }
}
