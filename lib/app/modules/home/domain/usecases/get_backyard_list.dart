import 'package:dartz/dartz.dart';

import 'package:racao_no_pote/app/core/error/failure.dart';
import 'package:racao_no_pote/app/modules/home/domain/repositories/backyard_repository.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/backyard.dart';

class GetBackyardList extends UseCase<List<Backyard>, NoParams>{

  final BackyardRepository backyardRepository;

  GetBackyardList(this.backyardRepository);

  @override
  Future<Either<Failure, List<Backyard>>> call(NoParams params) {
    return backyardRepository.getBackyardList();
  }
  

}