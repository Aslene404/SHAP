import 'dart:convert';

import 'package:shap/core/error/exception.dart';
import 'package:shap/features/company_search/data/models/company_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CompanySearchLocalDataSource {

  Future<Map<String,dynamic>?> getLastCompany();// returns last cached company info

  Future<void> cacheCompany(Map<String,dynamic>? companyToCache); // saves given company info to cache
}

const CACHED_COMPANY = 'CACHED_COMPANY';

class CompanySearchLocalDataSourceImpl implements CompanySearchLocalDataSource {
  final SharedPreferences sharedPreferences;

  CompanySearchLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Map<String,dynamic>?> getLastCompany() {
    final jsonString = sharedPreferences.getString(CACHED_COMPANY);//gets the last cached company as string

    if (jsonString != null) {
      return Future.value(json.decode(jsonString));// converts obtained string into Map
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCompany(Map<String,dynamic>? companyToCache) {
    return sharedPreferences.setString(
      CACHED_COMPANY,
      json.encode(companyToCache),
    );//saves given company info to cache as [key:"CACHED_COMPANY",value:"companyToCache"]
  }
}