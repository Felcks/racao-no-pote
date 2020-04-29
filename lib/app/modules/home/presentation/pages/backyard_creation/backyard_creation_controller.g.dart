// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backyard_creation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackyardCreationController on _BackyardCreationControllerBase, Store {
  final _$showErrorsAtom =
      Atom(name: '_BackyardCreationControllerBase.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.context.enforceReadPolicy(_$showErrorsAtom);
    _$showErrorsAtom.reportObserved();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.context.conditionallyRunInAction(() {
      super.showErrors = value;
      _$showErrorsAtom.reportChanged();
    }, _$showErrorsAtom, name: '${_$showErrorsAtom.name}_set');
  }

  final _$_BackyardCreationControllerBaseActionController =
      ActionController(name: '_BackyardCreationControllerBase');

  @override
  void setPresentationBackyard(Backyard backyard) {
    final _$actionInfo =
        _$_BackyardCreationControllerBaseActionController.startAction();
    try {
      return super.setPresentationBackyard(backyard);
    } finally {
      _$_BackyardCreationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'showErrors: ${showErrors.toString()}';
    return '{$string}';
  }
}
