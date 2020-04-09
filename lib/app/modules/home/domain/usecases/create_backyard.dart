import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
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
    final mBackyard = Backyard(food: food, water: water);
    return repository.updateBackyard(mBackyard);
  }
}
