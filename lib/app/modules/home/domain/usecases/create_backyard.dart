import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:timezone/timezone.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/backyard.dart';
import '../repositories/backyard_repository.dart';

class CreateBackyard extends UseCase<Backyard, BackyardParams> {
  final BackyardRepository repository;
  final Location defaultLocation;

  CreateBackyard(this.repository, this.defaultLocation);

  @override
  Future<Either<Failure, Backyard>> call(BackyardParams params) {
    final mBackyard = Backyard(
      id: null,
      food: Element(
        quantity: 0,
        maxQuantity: params.maxFoodQuantity,
        incrementDate: TZDateTime.now(defaultLocation),
        updateDate: TZDateTime.now(defaultLocation),
      ),
      water: Element(
        quantity: 0,
        maxQuantity: params.maxFoodQuantity,
        incrementDate: TZDateTime.now(defaultLocation),
        updateDate: TZDateTime.now(defaultLocation),
      ),
      cup: params.capacity != null ? Cup(capacity: params.capacity) : null,
      animal: Animal(
          name: params.name,
          nickname: params.nickName,
          birthday: TZDateTime.from(params.birthday, defaultLocation),
          weight: params.weight),
    );

    return repository.createBackyard(mBackyard);
  }
}

//Esse Params aqui deveria ter uma referencia para a classe da camada de apresentação e não esse frankestein
class BackyardParams {
  String name;
  String nickName;
  DateTime birthday;
  double weight;
  int capacity;
  int maxFoodQuantity;

  BackyardParams(
      {@required this.name,
      this.nickName,
      @required this.birthday,
      this.weight,
      this.capacity,
      @required this.maxFoodQuantity});
}
