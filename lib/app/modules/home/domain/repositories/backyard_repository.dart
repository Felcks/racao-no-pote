import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/backyard.dart';

abstract class BackyardRepository{
  Future<Either<Failure, List<Backyard>>> getBackyardList();

  Future<Either<Failure, Backyard>> getCachedBackyard();
  Future<Either<Failure, bool>> cacheBackyard(Backyard backyard);

  Future<Either<Failure, Backyard>> createBackyard(Backyard backyard);
  Future<Either<Failure, Backyard>> updateBackyard(Backyard backyard);

}