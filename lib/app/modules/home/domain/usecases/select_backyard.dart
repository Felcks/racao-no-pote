import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/backyard.dart';
import '../repositories/backyard_repository.dart';

class SelectBackyard extends UseCase<bool, SelectBackyardParams> {
  final BackyardRepository repository;

  SelectBackyard(this.repository);

  @override
  Future<Either<Failure, bool>> call(SelectBackyardParams params) {
    return repository.cacheBackyard(params.backyard);
  }
}

class SelectBackyardParams{
  final Backyard backyard;

  SelectBackyardParams({@required this.backyard});
}
