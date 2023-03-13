



import 'package:dartz/dartz.dart';

import 'package:shap/core/error/exception.dart';
import 'package:shap/core/network/network_info.dart';

import '../../../../core/error/failures.dart';
import '../datasources/login_remote_data_source.dart';

import '../../domain/repositories/login_repository.dart';
import '../datasources/login_local_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  var response;

  LoginRepositoryImpl(
      {
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Map<String, dynamic>?>> login(Map<String, dynamic> user) async {

    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.login(user);
      if (response is Map<String, dynamic>?) {
        print("ok ok ok");

        localDataSource.cacheLogin(response);//cache obtained  OK response
        Map<String, dynamic>? x = await localDataSource.getLastUser();//caching operation verification
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
  Future<Either<Failure, Map<String,dynamic>?>> login_google() async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.login_google();
      if (response is Map<String,dynamic>?) {
        print("ok ok ok");



        localDataSource.cacheLogin(response);// caching obtained Map
        var x = await localDataSource.getLastUser();// caching operation verfication
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
  Future<Either<Failure, Map<String, dynamic>?>> login_facebook() async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.login_facebook();
      if (response is Map<String, dynamic>?) {
        print("ok ok ok");

        localDataSource.cacheLogin(response);// caching obtained OK response
        Map<String, dynamic>? x = await localDataSource.getLastUser();// caching operation verfication
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
  Future<Either<Failure, Map<String, dynamic>?>> login_linked_in(Map<String,dynamic> user) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }
      response = await remoteDataSource.login_linked_in(user);
      if (response is Map<String, dynamic>?) {
        print("ok ok ok");
        localDataSource.cacheLogin(response);//cache obtained  OK response
        Map<String, dynamic>? x = await localDataSource.getLastUser();//caching operation verification
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
  Future<Either<Failure, Map<String, dynamic>?>> login_xing() async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await localDataSource.getLastUser();//obtaining the cached result done by the Xing widget (WebViewPlus Widget)
      if (response is Map<String, dynamic>?) {
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