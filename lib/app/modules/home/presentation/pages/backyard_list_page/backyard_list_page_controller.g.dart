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

  final _$hasSelectedBackyardAtom =
      Atom(name: '_BackyardListPageControllerBase.hasSelectedBackyard');

  @override
  bool get hasSelectedBackyard {
    _$hasSelectedBackyardAtom.context
        .enforceReadPolicy(_$hasSelectedBackyardAtom);
    _$hasSelectedBackyardAtom.reportObserved();
    return super.hasSelectedBackyard;
  }

  @override
  set hasSelectedBackyard(bool value) {
    _$hasSelectedBackyardAtom.context.conditionallyRunInAction(() {
      super.hasSelectedBackyard = value;
      _$hasSelectedBackyardAtom.reportChanged();
    }, _$hasSelectedBackyardAtom,
        name: '${_$hasSelectedBackyardAtom.name}_set');
  }

  final _$fetchBackyardListAsyncAction = AsyncAction('fetchBackyardList');

  @override
  Future fetchBackyardList() {
    return _$fetchBackyardListAsyncAction.run(() => super.fetchBackyardList());
  }

  final _$chooseBackyardAsyncAction = AsyncAction('chooseBackyard');

  @override
  Future<bool> chooseBackyard(Backyard backyard) {
    return _$chooseBackyardAsyncAction
        .run(() => super.chooseBackyard(backyard));
  }

  @override
  String toString() {
    final string =
        'backyardList: ${backyardList.toString()},hasSelectedBackyard: ${hasSelectedBackyard.toString()}';
    return '{$string}';
  }
}
