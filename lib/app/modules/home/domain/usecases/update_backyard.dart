import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:timezone/timezone.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/backyard.dart';
import '../repositories/backyard_repository.dart';

class UpdateBackyard extends UseCase<Backyard, UpdateBackyardParams> {
  final BackyardRepository repository;

  UpdateBackyard(this.repository);

  @override
  Future<Either<Failure, Backyard>> call(UpdateBackyardParams params) {
    final location = getLocation("Africa/Abidjan");
    params.backyard.food.updateDate = TZDateTime.now(location);
    params.backyard.water.updateDate = TZDateTime.now(location);
    return repository.updateBackyard(params.backyard);
  }
}

class UpdateBackyardParams extends Equatable {
  final Backyard backyard;

  UpdateBackyardParams({@required this.backyard}) : super([backyard]);
}
