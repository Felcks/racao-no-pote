// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backyard_creation_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackyardCreationModel on _BackyardCreationModelBase, Store {
  final _$backyardAtom = Atom(name: '_BackyardCreationModelBase.backyard');

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

  final _$isUsingCupAtom = Atom(name: '_BackyardCreationModelBase.isUsingCup');

  @override
  bool get isUsingCup {
    _$isUsingCupAtom.reportRead();
    return super.isUsingCup;
  }

  @override
  set isUsingCup(bool value) {
    _$isUsingCupAtom.reportWrite(value, super.isUsingCup, () {
      super.isUsingCup = value;
    });
  }

  final _$_BackyardCreationModelBaseActionController =
      ActionController(name: '_BackyardCreationModelBase');

  @override
  dynamic changeIsUsingCup(bool value) {
    final _$actionInfo = _$_BackyardCreationModelBaseActionController
        .startAction(name: '_BackyardCreationModelBase.changeIsUsingCup');
    try {
      return super.changeIsUsingCup(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_BackyardCreationModelBaseActionController
        .startAction(name: '_BackyardCreationModelBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNickName(String value) {
    final _$actionInfo = _$_BackyardCreationModelBaseActionController
        .startAction(name: '_BackyardCreationModelBase.changeNickName');
    try {
      return super.changeNickName(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBirthday(TZDateTime value) {
    final _$actionInfo = _$_BackyardCreationModelBaseActionController
        .startAction(name: '_BackyardCreationModelBase.changeBirthday');
    try {
      return super.changeBirthday(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeWeight(String value) {
    final _$actionInfo = _$_BackyardCreationModelBaseActionController
        .startAction(name: '_BackyardCreationModelBase.changeWeight');
    try {
      return super.changeWeight(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCupQuantity(String value) {
    final _$actionInfo = _$_BackyardCreationModelBaseActionController
        .startAction(name: '_BackyardCreationModelBase.changeCupQuantity');
    try {
      return super.changeCupQuantity(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFoodQuantity(String value) {
    final _$actionInfo = _$_BackyardCreationModelBaseActionController
        .startAction(name: '_BackyardCreationModelBase.changeFoodQuantity');
    try {
      return super.changeFoodQuantity(value);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBackyard(Backyard backyard) {
    final _$actionInfo = _$_BackyardCreationModelBaseActionController
        .startAction(name: '_BackyardCreationModelBase.setBackyard');
    try {
      return super.setBackyard(backyard);
    } finally {
      _$_BackyardCreationModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
backyard: ${backyard},
isUsingCup: ${isUsingCup}
    ''';
  }
}
