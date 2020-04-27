import 'package:dartz/dartz.dart';
import 'package:timezone/timezone.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/backyard.dart';
import '../repositories/backyard_repository.dart';

class ResetBackyardWhenDayPassed
    extends UseCase<Backyard, ResetBackyardWhenDayPassedParams> {
  final BackyardRepository repository;
  final Location userLocation;

  ResetBackyardWhenDayPassed(this.repository, this.userLocation);

  @override
  Future<Either<Failure, Backyard>> call(ResetBackyardWhenDayPassedParams params) async {
    final backyard = params.backyard;
    final currentTime = TZDateTime.now(userLocation);
    final backyardTime = TZDateTime.parse(
        userLocation, backyard.food.updateDate.toIso8601String());
    final dayStartTime = TZDateTime(
        userLocation, currentTime.year, currentTime.month, currentTime.day);

    Duration differenceCurrentAndBackyard =
        currentTime.difference(backyardTime);
    Duration differenceCurrentAndDayStartTime =
        currentTime.difference(dayStartTime);

    if (differenceCurrentAndBackyard > differenceCurrentAndDayStartTime) {
      backyard.food.updateDate = currentTime;
      backyard.food.quantity = 0;
      backyard.water.updateDate = currentTime;
      repository.updateBackyard(backyard);
      return Right(backyard);
    }

    return Left(CacheFailure());
  }
}

class ResetBackyardWhenDayPassedParams {
  final Backyard backyard;
  ResetBackyardWhenDayPassedParams(this.backyard);
}
