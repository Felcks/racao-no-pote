import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/backyard.dart';
import '../repositories/backyard_repository.dart';

class CreateBackyard extends UseCase<Backyard, CreateBackyardParams> {
  final BackyardRepository repository;

  CreateBackyard(this.repository);

  @override
  Future<Either<Failure, Backyard>> call(CreateBackyardParams params) {
    params.backyard.id = null;
    return repository.createBackyard(params.backyard);
  }
}

class CreateBackyardParams extends Equatable {
  final Backyard backyard;

  CreateBackyardParams({@required this.backyard}) : super([backyard]);
}

