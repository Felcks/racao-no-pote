// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$backyardAtom = Atom(name: '_HomeControllerBase.backyard');

  @override
  Backyard get backyard {
    _$backyardAtom.context.enforceReadPolicy(_$backyardAtom);
    _$backyardAtom.reportObserved();
    return super.backyard;
  }

  @override
  set backyard(Backyard value) {
    _$backyardAtom.context.conditionallyRunInAction(() {
      super.backyard = value;
      _$backyardAtom.reportChanged();
    }, _$backyardAtom, name: '${_$backyardAtom.name}_set');
  }

  final _$fetchBackyardAsyncAction = AsyncAction('fetchBackyard');

  @override
  Future fetchBackyard() {
    return _$fetchBackyardAsyncAction.run(() => super.fetchBackyard());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic updateElementQuantity(Element element, double value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.updateElementQuantity(element, value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'backyard: ${backyard.toString()}';
    return '{$string}';
  }
}
