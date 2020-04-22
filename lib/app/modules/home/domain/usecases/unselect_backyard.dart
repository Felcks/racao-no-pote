import 'package:dartz/dartz.dart';
import 'package:racao_no_pote/app/core/error/failure.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/core/usecases/usecase.dart';

class UnselectBackyard extends UseCase<bool, NoParams> {
  final BackyardRepository repository;

  UnselectBackyard(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository.cacheBackyard(null);
  }
}
