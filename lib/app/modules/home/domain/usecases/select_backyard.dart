import 'package:dartz/dartz.dart';
import 'package:racao_no_pote/app/core/error/failure.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/core/usecases/usecase.dart';
import 'package:meta/meta.dart';

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
