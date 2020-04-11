import 'package:dartz/dartz.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:timezone/timezone.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/backyard.dart';
import '../repositories/backyard_repository.dart';

class CreateBackyard extends UseCase<Backyard, NoParams> {
  final BackyardRepository repository;

  CreateBackyard(this.repository);

  @override
  Future<Either<Failure, Backyard>> call(NoParams params) {
    final location = getLocation("Africa/Abidjan");
    Element food = Element(
        quantity: 0,
        incrementDate: TZDateTime.now(location),
        updateDate: TZDateTime.now(location));
    Element water = food;
    Cup cup = Cup(capacity: 50);
    Animal animal = Animal(
        name: "Pandora",
        nickname: "Malucão",
        birthday: TZDateTime.parse(location, "2019-09-08T09:37:57.000+0000"),
        weight: 10.4);
    final mBackyard =
        Backyard(food: food, water: water, animal: animal, cup: cup);
    return repository.updateBackyard(mBackyard);
  }
}
