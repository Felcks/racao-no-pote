import 'package:mobx/mobx.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';
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
  String birthday;
  @action
  changeBirthday(String value) => birthday = value;

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

  _BackyardPresentationBase(){
    isUsingCup = false;
  }

}