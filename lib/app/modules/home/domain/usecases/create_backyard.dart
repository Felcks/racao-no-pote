import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/update_current_backyard.dart';
import 'package:timezone/timezone.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/backyard.dart';
import '../repositories/backyard_repository.dart';

class CreateBackyard extends UseCase<Backyard, BackyardParams> {
  final BackyardRepository repository;

  CreateBackyard(this.repository);

  @override
  Future<Either<Failure, Backyard>> call(BackyardParams params) {
    final location = getLocation("Africa/Abidjan");
    Element food = Element(
        quantity: 0,
        incrementDate: TZDateTime.now(location),
        updateDate: TZDateTime.now(location));
    Element water = food;
    Cup cup = params.capacity != null ? Cup(capacity: params.capacity) : null;
    Animal animal = Animal(
        name: params.name,
        nickname: params.nickName,
        birthday: params.birthday,
        weight: params.weight);
    final mBackyard =
        Backyard(id: 1, food: food, water: water, animal: animal, cup: cup);
    return repository.updateBackyard(mBackyard);
  }
}

class BackyardParams extends Equatable {
  String name;
  String nickName;
  TZDateTime birthday;
  double weight;
  int capacity;

  BackyardParams({
    @required this.name,
    this.nickName,
    @required this.birthday,
    this.weight,
    this.capacity
  });
}
