import 'package:dartz/dartz.dart';
import 'package:racao_no_pote/app/core/error/failure.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/core/usecases/usecase.dart';

class SelectBackyard extends UseCase<bool, IDParams> {
  final BackyardRepository repository;

  SelectBackyard(this.repository);

  @override
  Future<Either<Failure, bool>> call(IDParams params) {
    return repository.saveLastBackyard(params.id);
  }
}

class IDParams{
  final int id;

  IDParams(this.id);
}
