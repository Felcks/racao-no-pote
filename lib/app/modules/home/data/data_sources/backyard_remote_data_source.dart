import 'package:racao_no_pote/app/modules/home/data/models/backyard_model.dart';

abstract class BackyardRemoteDataSource {
  /// Calls the http://localhost.com/backyard endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<BackyardModel> getBackyard();
}

class BackyardRemoteDataSourceImpl extends BackyardRemoteDataSource {
  @override
  Future<BackyardModel> getBackyard() {
    // TODO: implement getBackyard
    return null;
  }
}
