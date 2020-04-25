import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/backyard.dart';
import '../../domain/repositories/backyard_repository.dart';
import '../data_sources/backyard_local_data_source.dart';
import '../data_sources/backyard_remote_data_source.dart';
import '../models/backyard_model.dart';

class BackyardRepositoryImpl extends BackyardRepository {
  final BackyardRemoteDataSource remoteDataSource;
  final BackyardLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  BackyardRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, List<Backyard>>> getBackyardList() async {
    networkInfo.isConnected;
    try {
      final backyardList = await localDataSource.getBackyardList();
      return Right(backyardList);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Backyard>> getCachedBackyard() async {
    networkInfo.isConnected;

    try {
      final backyardID = await localDataSource.getCachedBackyardID();
      final backyardList = await localDataSource.getBackyardList();

      if(backyardList == null)
        return Left(CacheFailure());

      BackyardModel backyard;
      backyardList.forEach((value) {
        if (value.id == backyardID) {
          backyard = value;
        }
      });

      if (backyard == null) return Left(CacheFailure());

      return Right(backyard);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> cacheBackyard(Backyard backyard) async {
    return Right(await localDataSource.cacheBackyardID(null));
  }

  // @override
  // Future<Either<Failure, int>> getCachedBackyardID() async {
  //   try {
  //     final backyardID = await localDataSource.getCachedBackyardID();
  //     return Right(backyardID);
  //   } on CacheException {
  //     return Left(CacheFailure());
  //   }
  // }

  @override
  Future<Either<Failure, Backyard>> updateBackyard(Backyard backyard) async {
    try {
      if (backyard.id == null) return Left(AlreadyCreatedFailure());

      List<BackyardModel> backyardList =
          await localDataSource.getBackyardList();
      bool foundElement = false;

      for (var i = 0; i < backyardList.length; i++) {
        if (backyardList[i].id == backyard.id) {
          backyardList[i] = backyard;
          foundElement = true;
        }
      }

      if (foundElement == false) return Left(AlreadyCreatedFailure());

      await localDataSource.cacheBackyardList(backyardList);
      return Right(backyard);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Backyard>> createBackyard(Backyard backyard) async {
    try {
      if (backyard.id != null) return Left(AlreadyCreatedFailure());

      BackyardModel backyardToAdd = BackyardModel.fromEntity(backyard);
      List<BackyardModel> backyardList;
      try {
        backyardList = await localDataSource.getBackyardList();
        backyard.id = (backyardList.length + 1);
        backyardList.add(backyardToAdd);
      } on CacheException {
        backyard.id = 1;
        backyardList = [backyardToAdd];
      }

      await localDataSource.cacheBackyardList(backyardList);
      return Right(backyard);
    } on CacheException {
      return Left(CacheFailure());
    } on AlreadyCreatedException {
      return Left(AlreadyCreatedFailure());
    }
  }
}
