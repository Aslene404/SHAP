

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shap/core/error/exception.dart';
import 'package:shap/core/network/network_info.dart';

import '../../../../core/error/failures.dart';
import '../datasources/company_search_remote_data_source.dart';

import '../../domain/repositories/company_search_repository.dart';
import '../datasources/company_search_local_data_source.dart';

class CompanySearchRepositoryImpl implements CompanySearchRepository {
  final CompanySearchRemoteDataSource remoteDataSource;
  final CompanySearchLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  var response;

  CompanySearchRepositoryImpl(
      {
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Map<String, dynamic>?>> company_search(Map<String, dynamic> company) async {

    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.company_search(company);
      if (response is Map<String, dynamic>?) {
        print("ok ok ok");

        localDataSource.cacheCompany(response);//cache obtained  OK response
        Map<String, dynamic>? x = await localDataSource.getLastCompany();//caching operation verification
        print(x);


        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption catch(e){
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> company_contact(String company_number) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.company_contact(company_number);
      if (response is Map<String, dynamic>?) {
        print("ok ok ok");

        localDataSource.cacheCompany(response);//cache obtained  OK response
        Map<String, dynamic>? x = await localDataSource.getLastCompany();//caching operation verification
        print(x);


        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption catch(e){
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> company_detail(String company_id) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.company_detail(company_id);
      if (response is Map<String, dynamic>?) {
        print("ok ok ok");

        localDataSource.cacheCompany(response);//cache obtained  OK response
        Map<String, dynamic>? x = await localDataSource.getLastCompany();//caching operation verification
        print(x);


        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption catch(e){
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> company_insolvency(String company_number) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.company_insolvency(company_number);
      if (response is Map<String, dynamic>?) {
        print("ok ok ok");

        localDataSource.cacheCompany(response);//cache obtained  OK response
        Map<String, dynamic>? x = await localDataSource.getLastCompany();//caching operation verification
        print(x);


        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption catch(e){
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> company_notices(String company_number) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.company_notices(company_number);
      if (response is Map<String, dynamic>?) {
        print("ok ok ok");

        localDataSource.cacheCompany(response);//cache obtained  OK response
        Map<String, dynamic>? x = await localDataSource.getLastCompany();//caching operation verification
        print(x);


        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption catch(e){
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> company_officers(String company_number) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.company_officers(company_number);
      if (response is Map<String, dynamic>?) {
        print("ok ok ok");

        localDataSource.cacheCompany(response);//cache obtained  OK response
        Map<String, dynamic>? x = await localDataSource.getLastCompany();//caching operation verification
        print(x);


        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption catch(e){
      return Left(ServerFailure(message: e.message));
    }
  }
  @override
  Future<Either<Failure, Map<String, dynamic>?>> company_documents(String company_id) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.company_documents(company_id);
      if (response is Map<String, dynamic>?) {
        print("ok ok ok");

        localDataSource.cacheCompany(response);//cache obtained  OK response
        Map<String, dynamic>? x = await localDataSource.getLastCompany();//caching operation verification
        print(x);


        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption catch(e){
      return Left(ServerFailure(message: e.message));
    }
  }
  @override
  Future<Either<Failure, Map<String, dynamic>?>> company_sheets(String company_id) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.company_sheets(company_id);
      if (response is Map<String, dynamic>?) {
        print("ok ok ok");

        localDataSource.cacheCompany(response);//cache obtained  OK response
        Map<String, dynamic>? x = await localDataSource.getLastCompany();//caching operation verification
        print(x);


        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption catch(e){
      return Left(ServerFailure(message: e.message));
    }
  }
  Future<Either<Failure, Map<String, dynamic>?>> company_stats(String company_number) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.company_stats(company_number);
      if (response is Map<String, dynamic>?) {
        print("ok ok ok");

        localDataSource.cacheCompany(response);//cache obtained  OK response
        Map<String, dynamic>? x = await localDataSource.getLastCompany();//caching operation verification
        print(x);


        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption catch(e){
      return Left(ServerFailure(message: e.message));
    }
  }
  Future<Either<Failure, List<dynamic>?>> company_branches(String company_number) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.company_branches(company_number);
      if (response is List<dynamic>?) {
        print("ok ok ok");



        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption catch(e){
      return Left(ServerFailure(message: e.message));
    }
  }

  
  
  

  




}