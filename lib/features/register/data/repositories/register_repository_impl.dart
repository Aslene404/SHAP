





import 'package:dartz/dartz.dart';
import 'package:shap/core/error/exception.dart';
import 'package:shap/core/error/failures.dart';
import 'package:shap/core/network/network_info.dart';
import 'package:shap/features/register/data/datasources/register_remote_data_source.dart';
import 'package:shap/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;
  var response;

  RegisterRepositoryImpl(
      {
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Map<String,dynamic>?>> register(Map<String, dynamic> user) async {

    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption(message: "no connection on your Device");
      }

      response = await remoteDataSource.register(user);
      print(response);
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