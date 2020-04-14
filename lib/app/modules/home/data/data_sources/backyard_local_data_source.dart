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
  Future<void> cacheBackyard(BackyardModel backyardToCache) async {
    List<BackyardModel> backyardList;
    try {
      backyardList = await getBackyardList();

      if(backyardToCache.id == 0){
        backyardToCache.id = (backyardList.length + 1);
      }

      bool isUpdate = false;

      for(var i = 0; i < backyardList.length; i++){
        if(backyardList[i].id == backyardToCache.id){
          backyardList[i] = backyardToCache;
          isUpdate = true;
        }
      }
      if (isUpdate == false) backyardList.add(backyardToCache);
    } on CacheException {
      backyardToCache.id = 1;
      backyardList = [backyardToCache];
    }

    var backyardJsonList = backyardList.map((it) => it.toJson()).toList();
    await sharedPreferences.setString(
        CACHED_BACKYARD_LIST, json.encode(backyardJsonList));

    return sharedPreferences.setInt(CACHED_BACKYARD, backyardToCache.id);
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
}
