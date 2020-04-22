import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/backyard.dart';
import '../repositories/backyard_repository.dart';

class ViewBackyard extends UseCase<Backyard, NoParams> {
  final BackyardRepository repository;

  ViewBackyard(this.repository);

  @override
  Future<Either<Failure, Backyard>> call(NoParams params) {
    return repository.getBackyard();
  }
}
