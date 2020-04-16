import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../models/backyard_model.dart';

abstract class BackyardLocalDataSource {
  /// Gets the [BackyardModel] that has the passed [id]
  /// the user had no internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<BackyardModel> getBackyard(int id);

  /// Gets the [List<BackyardModel>] that is cached
  /// the user had no internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<List<BackyardModel>> getBackyardList();

  /// Caches the [id] of backyard
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<bool> cacheBackyardID(int id);

  /// Gets the cached [id] which was chached
  /// the user had an internet connection.
  ///
  /// Returns null if there is no cached data
  Future<int> getCachedBackyardID();

  

  Future<BackyardModel> cacheBackyard(BackyardModel backyardToCache);
  Future<BackyardModel> updateBackyard(BackyardModel backyardToCache);
}

const CACHED_BACKYARD = 'CACHED_BACKYARD';
const CACHED_BACKYARD_LIST = 'CACHED_BACKYARD_LIST';

class BackyardLocalDataSourceImpl extends BackyardLocalDataSource {
  final SharedPreferences sharedPreferences;

  BackyardLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<BackyardModel> cacheBackyard(BackyardModel backyardToCache) async {
    if (backyardToCache.id != null) throw AlreadyCreatedException();

    List<BackyardModel> backyardList;
    try {
      backyardList = await getBackyardList();
      backyardToCache.id = (backyardList.length + 1);
      backyardList.add(backyardToCache);
    } on CacheException {
      backyardToCache.id = 1;
      backyardList = [backyardToCache];
    }

    var backyardJsonList = backyardList.map((it) => it.toJson()).toList();
    await sharedPreferences.setString(
        CACHED_BACKYARD_LIST, json.encode(backyardJsonList));

    return backyardToCache;
  }

  @override
  Future<BackyardModel> updateBackyard(BackyardModel backyardToCache) async {
    if (backyardToCache.id == null) throw Exception();

    List<BackyardModel> backyardList = await getBackyardList();
    bool foundElement = false;

    for (var i = 0; i < backyardList.length; i++) {
      if (backyardList[i].id == backyardToCache.id) {
        backyardList[i] = backyardToCache;
        foundElement = true;
      }
    }

    if (foundElement == false) throw Exception();

    var backyardJsonList = backyardList.map((it) => it.toJson()).toList();
    await sharedPreferences.setString(
        CACHED_BACKYARD_LIST, json.encode(backyardJsonList));

    return backyardToCache;
  }

  @override
  Future<BackyardModel> getBackyard(int backyardID) async {
    final backyardList = await getBackyardList();

    if (backyardList != null && backyardID != null) {
      BackyardModel lastBackyard;
      backyardList.forEach((value) {
        if (value.id == backyardID) {
          lastBackyard = value;
        }
      });
      return lastBackyard;
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

  @override
  Future<bool> cacheBackyardID(int id) async {
    return sharedPreferences.setInt(CACHED_BACKYARD, id);
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
}
