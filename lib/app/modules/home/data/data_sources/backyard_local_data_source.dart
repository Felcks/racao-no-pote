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

  Future<BackyardModel> cacheBackyard(BackyardModel backyardToCache);
  Future<BackyardModel> updateBackyard(BackyardModel backyardToCache);

  Future<bool> cacheLastBackyard(int id);
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
      //bool isUpdate = false;

      // for(var i = 0; i < backyardList.length; i++){
      //   if(backyardList[i].id == backyardToCache.id){
      //     backyardList[i] = backyardToCache;
      //     isUpdate = true;
      //   }
      // }
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
    if(backyardToCache.id == null)
      throw Exception();

    List<BackyardModel> backyardList = await getBackyardList();
    bool foundElement = false;

    for (var i = 0; i < backyardList.length; i++) {
      if (backyardList[i].id == backyardToCache.id) {
        backyardList[i] = backyardToCache;
        foundElement = true;
      }
    }

    if(foundElement == false)
      throw Exception();

    var backyardJsonList = backyardList.map((it) => it.toJson()).toList();
    await sharedPreferences.setString(
        CACHED_BACKYARD_LIST, json.encode(backyardJsonList));

    return backyardToCache;
  }

  @override
  Future<BackyardModel> getLastBackyard() async {
    final backyardList = await getBackyardList();
    int lastBackyardID = sharedPreferences.getInt(CACHED_BACKYARD);

    if (backyardList != null && lastBackyardID != null) {
      BackyardModel lastBackyard;
      backyardList.forEach((value) {
        if (value.id == lastBackyardID) {
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
  Future<bool> cacheLastBackyard(int id) async {
    return sharedPreferences.setInt(CACHED_BACKYARD, id);
  }
}
