// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backyard_list_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackyardListPageController on _BackyardListPageControllerBase, Store {
  final _$backyardListAtom =
      Atom(name: '_BackyardListPageControllerBase.backyardList');

  @override
  ObservableList<Backyard> get backyardList {
    _$backyardListAtom.context.enforceReadPolicy(_$backyardListAtom);
    _$backyardListAtom.reportObserved();
    return super.backyardList;
  }

  @override
  set backyardList(ObservableList<Backyard> value) {
    _$backyardListAtom.context.conditionallyRunInAction(() {
      super.backyardList = value;
      _$backyardListAtom.reportChanged();
    }, _$backyardListAtom, name: '${_$backyardListAtom.name}_set');
  }

  final _$fetchBackyardListAsyncAction = AsyncAction('fetchBackyardList');

  @override
  Future fetchBackyardList() {
    return _$fetchBackyardListAsyncAction.run(() => super.fetchBackyardList());
  }

  final _$selectBackyardAsyncAction = AsyncAction('selectBackyard');

  @override
  Future<bool> selectBackyard(int id) {
    return _$selectBackyardAsyncAction.run(() => super.selectBackyard(id));
  }

  @override
  String toString() {
    final string = 'backyardList: ${backyardList.toString()}';
    return '{$string}';
  }
}
