import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/backyard_repository.dart';

class UnselectBackyard extends UseCase<bool, NoParams> {
  final BackyardRepository repository;

  UnselectBackyard(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository.cacheBackyard(null);
  }
}
