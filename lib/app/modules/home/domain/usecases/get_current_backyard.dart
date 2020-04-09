import 'package:dartz/dartz.dart';
import 'package:racao_no_pote/app/core/error/failure.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';
import 'package:racao_no_pote/app/core/usecases/usecase.dart';

class GetCurrentBackyard extends UseCase<Backyard, NoParams> {
  final BackyardRepository repository;

  GetCurrentBackyard(this.repository);

  @override
  Future<Either<Failure, Backyard>> call(NoParams params) {
    return repository.getBackyard();
  }
}
