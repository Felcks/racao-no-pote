// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backyard_list_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackyardListPageController on _BackyardListPageControllerBase, Store {
  final _$backyardListAtom =
      Atom(name: '_BackyardListPageControllerBase.backyardList');

  @override
  ObservableList<Backyard> get backyardList {
    _$backyardListAtom.reportRead();
    return super.backyardList;
  }

  @override
  set backyardList(ObservableList<Backyard> value) {
    _$backyardListAtom.reportWrite(value, super.backyardList, () {
      super.backyardList = value;
    });
  }

  final _$fetchBackyardListAsyncAction =
      AsyncAction('_BackyardListPageControllerBase.fetchBackyardList');

  @override
  Future fetchBackyardList() {
    return _$fetchBackyardListAsyncAction.run(() => super.fetchBackyardList());
  }

  final _$selectBackyardAsyncAction =
      AsyncAction('_BackyardListPageControllerBase.selectBackyard');

  @override
  Future<bool> selectBackyard(Backyard backyard) {
    return _$selectBackyardAsyncAction
        .run(() => super.selectBackyard(backyard));
  }

  @override
  String toString() {
    return '''
backyardList: ${backyardList}
    ''';
  }
}
