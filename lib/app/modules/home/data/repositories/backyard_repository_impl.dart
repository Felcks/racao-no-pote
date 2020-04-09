import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:racao_no_pote/app/modules/home/data/models/backyard_model.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/backyard.dart';
import '../../domain/repositories/backyard_repository.dart';
import '../data_sources/backyard_local_data_source.dart';
import '../data_sources/backyard_remote_data_source.dart';

class BackyardRepositoryImpl extends BackyardRepository {
  final BackyardRemoteDataSource remoteDataSource;
  final BackyardLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  BackyardRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, Backyard>> getBackyard() async {
    networkInfo.isConnected;

    try {
      final backyard = await localDataSource.getLastBackyard();
      return Right(backyard);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Backyard>> updateBackyard(Backyard backyard) async{
    try{
      localDataSource.cacheBackyard(BackyardModel.fromEntity(backyard));
      return Right(backyard);
    }
    on Exception{
      return Left(CacheFailure());
    }
  }
}
