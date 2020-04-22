import 'package:dartz/dartz.dart';
import 'package:racao_no_pote/app/core/error/failure.dart';
import 'package:racao_no_pote/app/core/usecases/usecase.dart';
import 'package:timezone/timezone.dart';

import '../repositories/backyard_repository.dart';

class ResetBackyardWhenDayPassed extends UseCase<bool, Params> {
  final BackyardRepository repository;
  final Location userLocation;

  ResetBackyardWhenDayPassed(this.repository, this.userLocation);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    final backyard = await repository.getBackyard();
    backyard.fold((failure) {
      return Left(failure);
    }, (success) async {
      final currentTime = TZDateTime.now(userLocation);
      final backyardTime = TZDateTime.parse(
          userLocation, success.food.updateDate.toIso8601String());
      final dayStartTime = TZDateTime(userLocation, currentTime.year, currentTime.month, currentTime.day);

      Duration differenceCurrentAndBackyard = currentTime.difference(backyardTime);
      Duration differenceCurrentAndDayStartTime = currentTime.difference(dayStartTime);

      if (differenceCurrentAndBackyard > differenceCurrentAndDayStartTime) {
        success.food.updateDate = currentTime;
        success.food.quantity = 0;
        success.water.updateDate = currentTime;
        await repository.updateBackyard(success);
      }

      return Future.value(Right(true));
    });

    return Future.value(Right(backyard.isRight()));
  }
}

class Params {
  final int backyardID;
  Params(this.backyardID);
}
