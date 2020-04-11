import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../models/backyard_model.dart';

abstract class BackyardLocalDataSource {
  /// Gets the cached [BackyardModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<BackyardModel> getLastBackyard();

  Future<List<BackyardModel>> getBackyardList();

  Future<void> cacheBackyard(BackyardModel backyardToCache);
}

const CACHED_BACKYARD = 'CACHED_BACKYARD';
const CACHED_BACKYARD_LIST = 'CACHED_BACKYARD_LIST';

class BackyardLocalDataSourceImpl extends BackyardLocalDataSource {
  final SharedPreferences sharedPreferences;

  BackyardLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheBackyard(BackyardModel backyardToCache) {
    return sharedPreferences.setString(
        CACHED_BACKYARD, json.encode(backyardToCache.toJson()));
  }

  @override
  Future<BackyardModel> getLastBackyard() {
    final jsonString = sharedPreferences.getString(CACHED_BACKYARD);
    if (jsonString != null) {
      return Future.value(BackyardModel.fromJson(json.decode(jsonString)));
    } else
      throw CacheException();
  }

  @override
  Future<List<BackyardModel>> getBackyardList() {
    final jsonString = sharedPreferences.getString(CACHED_BACKYARD_LIST);
    if (jsonString != null) {
      final List<BackyardModel> result = [];
      json.decode(jsonString).forEach((value) {
        result.add(BackyardModel.fromJson(value));
      });

      return Future.value(result);
    } else {
      throw CacheException();
    }
  }
}
