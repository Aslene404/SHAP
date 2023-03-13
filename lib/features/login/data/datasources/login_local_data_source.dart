import 'dart:convert';

import 'package:shap/core/error/exception.dart';
import 'package:shap/features/login/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataSource {

  Future<Map<String,dynamic>?> getLastUser();// returns last cached user info

  Future<void> cacheLogin(Map<String,dynamic>? userToCache); // saves given user info to cache
}

const CACHED_USER = 'CACHED_USER';

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Map<String,dynamic>?> getLastUser() {
    final jsonString = sharedPreferences.getString(CACHED_USER);//gets the last cached user as string

    if (jsonString != null) {
      return Future.value(json.decode(jsonString));// converts obtained string into Map
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheLogin(Map<String,dynamic>? userToCache) {
    return sharedPreferences.setString(
      CACHED_USER,
      json.encode(userToCache),
    );//saves given user info to cache as [key:"CHACHED_USER",value:"userToCache"]
  }
}