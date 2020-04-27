import 'package:mobx/mobx.dart';
part 'backyard_presentation.g.dart';

class BackyardPresentation = _BackyardPresentationBase with _$BackyardPresentation;

abstract class _BackyardPresentationBase with Store {
  @observable
  String name;
  @action
  changeName(String value) => name = value;

  @observable
  String nickname;
  @action
  changeNickName(String value) => nickname = value;

  @observable
  DateTime birthday;
  @action
  changeBirthday(DateTime value) => birthday = value;

  @observable
  String weight;
  @action
  changeWeight(String value) => weight = value;

  @observable
  String cupQuantity;
  @action
  changeCupQuantity(String value) => cupQuantity = value;

  @observable
  bool isUsingCup;
  @action
  changeIsUsingCup(bool value) => isUsingCup = value;

  @observable
  String foodQuantity;
  @action
  changeFoodQuantity(String value) => foodQuantity = value;

  _BackyardPresentationBase(){
    changeIsUsingCup(false);
  }
}