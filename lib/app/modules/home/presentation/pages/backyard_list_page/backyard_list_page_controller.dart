import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/backyard.dart';
import '../../../domain/usecases/get_backyard_list.dart';

part 'backyard_list_page_controller.g.dart';

class BackyardListPageController = _BackyardListPageControllerBase
    with _$BackyardListPageController;

abstract class _BackyardListPageControllerBase with Store {
  final getBackyardList = Modular.get<GetBackyardList>();

  @observable
  ObservableList<Backyard> backyardList;

  _BackyardListPageControllerBase() {
    fetchBackyardList();
  }

  @action
  fetchBackyardList() async {
    final result = await getBackyardList(NoParams());
    print(result);
    backyardList = result.fold((failure) {
      List<Backyard> emptyList = [];
      return emptyList.asObservable();
    }, (backyardList) => this.backyardList = backyardList.asObservable());
  }
}
