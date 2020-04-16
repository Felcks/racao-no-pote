import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/cup.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/animal.dart';
import 'package:timezone/timezone.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/backyard.dart';
import '../repositories/backyard_repository.dart';

class CreateBackyard extends UseCase<Backyard, Params> {
  final BackyardRepository repository;

  CreateBackyard(this.repository);

  @override
  Future<Either<Failure, Backyard>> call(Params params) {
    params.backyard.id = null;
    return repository.createBackyard(params.backyard);
  }
}

class Params extends Equatable {
  final Backyard backyard;

  Params({@required this.backyard}) : super([backyard]);
}

