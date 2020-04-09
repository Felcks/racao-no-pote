import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/backyard.dart';

abstract class BackyardRepository{
  Future<Either<Failure, Backyard>> getBackyard();
  Future<Either<Failure, Backyard>> updateBackyard(Backyard backyard);
}