import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/backyard.dart';
import '../repositories/backyard_repository.dart';

class ListBackyard extends UseCase<List<Backyard>, NoParams>{

  final BackyardRepository backyardRepository;

  ListBackyard(this.backyardRepository);

  @override
  Future<Either<Failure, List<Backyard>>> call(NoParams params) {
    return backyardRepository.getBackyardList();
  }
}