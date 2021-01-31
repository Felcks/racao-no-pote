// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backyard_creation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackyardCreationController on _BackyardCreationControllerBase, Store {
  final _$showErrorsAtom =
      Atom(name: '_BackyardCreationControllerBase.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  final _$_BackyardCreationControllerBaseActionController =
      ActionController(name: '_BackyardCreationControllerBase');

  @override
  void setPresentationBackyard(Backyard backyard) {
    final _$actionInfo =
        _$_BackyardCreationControllerBaseActionController.startAction(
            name: '_BackyardCreationControllerBase.setPresentationBackyard');
    try {
      return super.setPresentationBackyard(backyard);
    } finally {
      _$_BackyardCreationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showErrors: ${showErrors}
    ''';
  }
}
