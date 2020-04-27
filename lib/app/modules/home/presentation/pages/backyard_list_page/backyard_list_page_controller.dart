import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/backyard.dart';
import '../../../domain/usecases/list_backyard.dart';
import '../../../domain/usecases/select_backyard.dart';

part 'backyard_list_page_controller.g.dart';

class BackyardListPageController = _BackyardListPageControllerBase
    with _$BackyardListPageController;

abstract class _BackyardListPageControllerBase with Store {
  final _listBackyard = Modular.get<ListBackyard>();
  final _selectBackyard = Modular.get<SelectBackyard>();

  @observable
  ObservableList<Backyard> backyardList;

  @action
  fetchBackyardList() async {
    final result = await _listBackyard(NoParams());
    backyardList = result.fold((failure) {
      List<Backyard> emptyList = [];
      return emptyList.asObservable();
    }, (backyardList) => this.backyardList = backyardList.asObservable());
  }

  @action
  Future<bool> selectBackyard(Backyard backyard) async {
    final result = await _selectBackyard(SelectBackyardParams(backyard: backyard));
    return result.isRight();
  }
}
