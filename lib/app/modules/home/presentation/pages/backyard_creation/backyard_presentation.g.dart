// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backyard_presentation.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackyardPresentation on _BackyardPresentationBase, Store {
  final _$nameAtom = Atom(name: '_BackyardPresentationBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$nicknameAtom = Atom(name: '_BackyardPresentationBase.nickname');

  @override
  String get nickname {
    _$nicknameAtom.context.enforceReadPolicy(_$nicknameAtom);
    _$nicknameAtom.reportObserved();
    return super.nickname;
  }

  @override
  set nickname(String value) {
    _$nicknameAtom.context.conditionallyRunInAction(() {
      super.nickname = value;
      _$nicknameAtom.reportChanged();
    }, _$nicknameAtom, name: '${_$nicknameAtom.name}_set');
  }

  final _$birthdayAtom = Atom(name: '_BackyardPresentationBase.birthday');

  @override
  DateTime get birthday {
    _$birthdayAtom.context.enforceReadPolicy(_$birthdayAtom);
    _$birthdayAtom.reportObserved();
    return super.birthday;
  }

  @override
  set birthday(DateTime value) {
    _$birthdayAtom.context.conditionallyRunInAction(() {
      super.birthday = value;
      _$birthdayAtom.reportChanged();
    }, _$birthdayAtom, name: '${_$birthdayAtom.name}_set');
  }

  final _$weightAtom = Atom(name: '_BackyardPresentationBase.weight');

  @override
  String get weight {
    _$weightAtom.context.enforceReadPolicy(_$weightAtom);
    _$weightAtom.reportObserved();
    return super.weight;
  }

  @override
  set weight(String value) {
    _$weightAtom.context.conditionallyRunInAction(() {
      super.weight = value;
      _$weightAtom.reportChanged();
    }, _$weightAtom, name: '${_$weightAtom.name}_set');
  }

  final _$cupQuantityAtom = Atom(name: '_BackyardPresentationBase.cupQuantity');

  @override
  String get cupQuantity {
    _$cupQuantityAtom.context.enforceReadPolicy(_$cupQuantityAtom);
    _$cupQuantityAtom.reportObserved();
    return super.cupQuantity;
  }

  @override
  set cupQuantity(String value) {
    _$cupQuantityAtom.context.conditionallyRunInAction(() {
      super.cupQuantity = value;
      _$cupQuantityAtom.reportChanged();
    }, _$cupQuantityAtom, name: '${_$cupQuantityAtom.name}_set');
  }

  final _$isUsingCupAtom = Atom(name: '_BackyardPresentationBase.isUsingCup');

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

  final _$foodQuantityAtom =
      Atom(name: '_BackyardPresentationBase.foodQuantity');

  @override
  String get foodQuantity {
    _$foodQuantityAtom.context.enforceReadPolicy(_$foodQuantityAtom);
    _$foodQuantityAtom.reportObserved();
    return super.foodQuantity;
  }

  @override
  set foodQuantity(String value) {
    _$foodQuantityAtom.context.conditionallyRunInAction(() {
      super.foodQuantity = value;
      _$foodQuantityAtom.reportChanged();
    }, _$foodQuantityAtom, name: '${_$foodQuantityAtom.name}_set');
  }

  final _$_BackyardPresentationBaseActionController =
      ActionController(name: '_BackyardPresentationBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo =
        _$_BackyardPresentationBaseActionController.startAction();
    try {
      return super.changeName(value);
    } finally {
      _$_BackyardPresentationBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNickName(String value) {
    final _$actionInfo =
        _$_BackyardPresentationBaseActionController.startAction();
    try {
      return super.changeNickName(value);
    } finally {
      _$_BackyardPresentationBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBirthday(DateTime value) {
    final _$actionInfo =
        _$_BackyardPresentationBaseActionController.startAction();
    try {
      return super.changeBirthday(value);
    } finally {
      _$_BackyardPresentationBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeWeight(String value) {
    final _$actionInfo =
        _$_BackyardPresentationBaseActionController.startAction();
    try {
      return super.changeWeight(value);
    } finally {
      _$_BackyardPresentationBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCupQuantity(String value) {
    final _$actionInfo =
        _$_BackyardPresentationBaseActionController.startAction();
    try {
      return super.changeCupQuantity(value);
    } finally {
      _$_BackyardPresentationBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsUsingCup(bool value) {
    final _$actionInfo =
        _$_BackyardPresentationBaseActionController.startAction();
    try {
      return super.changeIsUsingCup(value);
    } finally {
      _$_BackyardPresentationBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFoodQuantity(String value) {
    final _$actionInfo =
        _$_BackyardPresentationBaseActionController.startAction();
    try {
      return super.changeFoodQuantity(value);
    } finally {
      _$_BackyardPresentationBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'name: ${name.toString()},nickname: ${nickname.toString()},birthday: ${birthday.toString()},weight: ${weight.toString()},cupQuantity: ${cupQuantity.toString()},isUsingCup: ${isUsingCup.toString()},foodQuantity: ${foodQuantity.toString()}';
    return '{$string}';
  }
}
