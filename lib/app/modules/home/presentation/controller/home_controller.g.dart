// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$backyardAtom = Atom(name: '_HomeControllerBase.backyard');

  @override
  Backyard get backyard {
    _$backyardAtom.reportRead();
    return super.backyard;
  }

  @override
  set backyard(Backyard value) {
    _$backyardAtom.reportWrite(value, super.backyard, () {
      super.backyard = value;
    });
  }

  final _$_checkBackyardAsyncAction =
      AsyncAction('_HomeControllerBase._checkBackyard');

  @override
  Future _checkBackyard(Backyard backyard) {
    return _$_checkBackyardAsyncAction
        .run(() => super._checkBackyard(backyard));
  }

  final _$fetchBackyardAsyncAction =
      AsyncAction('_HomeControllerBase.fetchBackyard');

  @override
  Future fetchBackyard() {
    return _$fetchBackyardAsyncAction.run(() => super.fetchBackyard());
  }

  final _$unselectBackyardAsyncAction =
      AsyncAction('_HomeControllerBase.unselectBackyard');

  @override
  Future unselectBackyard() {
    return _$unselectBackyardAsyncAction.run(() => super.unselectBackyard());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic updateElementQuantity(Element element, double value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.updateElementQuantity');
    try {
      return super.updateElementQuantity(element, value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
backyard: ${backyard}
    ''';
  }
}
