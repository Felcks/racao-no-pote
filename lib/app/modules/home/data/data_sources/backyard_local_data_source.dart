import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../models/backyard_model.dart';

abstract class BackyardLocalDataSource {
  /// Gets the [List<BackyardModel>] that is cached
  /// the user had no internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<List<BackyardModel>> getBackyardList();

  /// Caches the [List<BackyardModel>] passed
  /// the user had no internet connection.
  Future<bool> cacheBackyardList(List<BackyardModel> backyardListToCache);

  /// Gets the cached [id] which was chached
  /// the user had no internet connection.
  ///
  /// Returns null if there is no cached data
  Future<int> getCachedBackyardID();

  /// Caches the [id] of backyard
  /// the user had no internet connection.
  Future<bool> cacheBackyardID(int id);
}

const CACHED_BACKYARD = 'CACHED_BACKYARD';
const CACHED_BACKYARD_LIST = 'CACHED_BACKYARD_LIST';

class BackyardLocalDataSourceImpl extends BackyardLocalDataSource {
  final SharedPreferences sharedPreferences;

  BackyardLocalDataSourceImpl({@required this.sharedPreferences});

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

  @override
  Future<bool> cacheBackyardList(List<BackyardModel> backyardListToCache) async {
    var backyardJsonList =
        backyardListToCache.map((it) => it.toJson()).toList();
    await sharedPreferences.setString(
        CACHED_BACKYARD_LIST, json.encode(backyardJsonList));

    return true;
  }

  @override
  Future<int> getCachedBackyardID() {
    int id = sharedPreferences.getInt(CACHED_BACKYARD);
    if (id != null) {
      return Future.value(id);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> cacheBackyardID(int id) async {
    return sharedPreferences.setInt(CACHED_BACKYARD, id);
  }
}
