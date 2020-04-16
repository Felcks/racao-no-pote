import 'package:dartz/dartz.dart';
import 'package:racao_no_pote/app/core/error/failure.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/core/usecases/usecase.dart';
import 'package:meta/meta.dart';

class SelectBackyard extends UseCase<bool, Params> {
  final BackyardRepository repository;

  SelectBackyard(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) {
    return repository.saveLastBackyard(params.id);
  }
}

class Params{
  final int id;

  Params({@required this.id});
}
