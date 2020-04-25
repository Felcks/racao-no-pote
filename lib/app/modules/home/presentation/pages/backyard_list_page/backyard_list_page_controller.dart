import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/backyard.dart';
import '../../../domain/usecases/list_backyard.dart' as mListBackyard;
import '../../../domain/usecases/select_backyard.dart' as mSelectBackyard;
import '../../../domain/usecases/view_backyard.dart' as mViewBackyard;

part 'backyard_list_page_controller.g.dart';

class BackyardListPageController = _BackyardListPageControllerBase
    with _$BackyardListPageController;

abstract class _BackyardListPageControllerBase with Store {
  final listBackyard = Modular.get<mListBackyard.ListBackyard>();
  final selectBackyard = Modular.get<mSelectBackyard.SelectBackyard>();
  final viewBackyard = Modular.get<mViewBackyard.ViewBackyard>();

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
  Future<bool> chooseBackyard(Backyard backyard) async {
    final result = await selectBackyard(mSelectBackyard.Params(backyard: backyard));
    return result.isRight();
  }
}
