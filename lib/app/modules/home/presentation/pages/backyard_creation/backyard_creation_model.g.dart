// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backyard_creation_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackyardCreationModel on _BackyardCreationModelBase, Store {
  final _$backyardAtom = Atom(name: '_BackyardCreationModelBase.backyard');

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

  final _$isUsingCupAtom = Atom(name: '_BackyardCreationModelBase.isUsingCup');

  @override
  bool get isUsingCup {
    _$isUsingCupAtom.context.enforceReadPolicy(_$isUsingCupAtom);
    _$isUsingCupAtom.reportObserved();
    return super.isUsingCup;
  }

  @override
  set isUsingCup(bool value) {
    _$isUsingCupAtom.context.conditionallyRunInAction(() {
      super.isUsingCup = value;
      _$isUsingCupAtom.reportChanged();
    }, _$isUsingCupAtom, name: '${_$isUsingCupAtom.name}_set');
  }

  final _$_BackyardCreationModelBaseActionController =
      ActionController(name: '_BackyardCreationModelBase');

  @override
  dynamic changeIsUsingCup(bool value) {
    final _$actionInfo =
        _$_BackyardCreationModelBaseActionController.startAction();
    try {
      return super.changeIsUsingCup(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName(String value) {
    final _$actionInfo =
        _$_BackyardCreationModelBaseActionController.startAction();
    try {
      return super.changeName(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNickName(String value) {
    final _$actionInfo =
        _$_BackyardCreationModelBaseActionController.startAction();
    try {
      return super.changeNickName(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBirthday(TZDateTime value) {
    final _$actionInfo =
        _$_BackyardCreationModelBaseActionController.startAction();
    try {
      return super.changeBirthday(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeWeight(String value) {
    final _$actionInfo =
        _$_BackyardCreationModelBaseActionController.startAction();
    try {
      return super.changeWeight(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCupQuantity(String value) {
    final _$actionInfo =
        _$_BackyardCreationModelBaseActionController.startAction();
    try {
      return super.changeCupQuantity(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFoodQuantity(String value) {
    final _$actionInfo =
        _$_BackyardCreationModelBaseActionController.startAction();
    try {
      return super.changeFoodQuantity(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBackyard(Backyard backyard) {
    final _$actionInfo =
        _$_BackyardCreationModelBaseActionController.startAction();
    try {
      return super.setBackyard(backyard);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'backyard: ${backyard.toString()},isUsingCup: ${isUsingCup.toString()}';
    return '{$string}';
  }
}
