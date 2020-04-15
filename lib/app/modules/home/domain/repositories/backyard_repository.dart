import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/backyard.dart';

abstract class BackyardRepository{
  Future<Either<Failure, Backyard>> getBackyard();
  Future<Either<Failure, Backyard>> updateBackyard(Backyard backyard);
  Future<Either<Failure, List<Backyard>>> getBackyardList();
  Future<Either<Failure, Backyard>> createBackyard(Backyard backyard);
  Future<Either<Failure, bool>> saveLastBackyard(int id);
}