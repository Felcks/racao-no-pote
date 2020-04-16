import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/backyard.dart';
import '../repositories/backyard_repository.dart';

class ViewBackyard extends UseCase<Backyard, Params> {
  final BackyardRepository repository;

  ViewBackyard(this.repository);

  @override
  Future<Either<Failure, Backyard>> call(Params params) {
    return repository.getBackyard(params.backyardID);
  }
}

class Params {
  final int backyardID;

  Params({@required this.backyardID});
}
