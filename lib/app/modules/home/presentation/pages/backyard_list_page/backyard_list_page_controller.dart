import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../domain/usecases/select_backyard.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/backyard.dart';
import '../../../domain/usecases/list_backyard.dart';

part 'backyard_list_page_controller.g.dart';

class BackyardListPageController = _BackyardListPageControllerBase
    with _$BackyardListPageController;

abstract class _BackyardListPageControllerBase with Store {
  final getBackyardList = Modular.get<ListBackyard>();
  final saveLastBackyard = Modular.get<SelectBackyard>();

  @observable
  ObservableList<Backyard> backyardList;

  _BackyardListPageControllerBase() {
    fetchBackyardList();
  }

  @action
  fetchBackyardList() async {
    final result = await getBackyardList(NoParams());
    backyardList = result.fold((failure) {
      List<Backyard> emptyList = [];
      return emptyList.asObservable();
    }, (backyardList) => this.backyardList = backyardList.asObservable());
  }

  @action
  Future<bool> selectBackyard(int id) async {
    final result = await saveLastBackyard(IDParams(id));
    return result.isRight();
  }
}
