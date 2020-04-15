import 'package:dartz/dartz.dart';
import 'package:racao_no_pote/app/core/error/failure.dart';
import 'package:racao_no_pote/app/core/usecases/usecase.dart';
import 'package:timezone/timezone.dart';

import '../repositories/backyard_repository.dart';

class ResetBackyardWhenDayPassed extends UseCase<bool, NoParams> {
  final BackyardRepository repository;
  final Location userLocation;

  ResetBackyardWhenDayPassed(this.repository, this.userLocation);

  @override
  Future<Either<Failure, bool>> call(NoParams noParams) async {
    final backyard = await repository.getBackyard();
    backyard.fold((failure) {
      return Left(failure);
    }, (success) async {
      final currentTime = TZDateTime.now(userLocation);
      final backyardTime = TZDateTime.parse(
          userLocation, success.food.updateDate.toIso8601String());

      Duration difference = currentTime.difference(backyardTime);
      if (difference.inDays > 0) {
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
