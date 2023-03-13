import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shap/core/error/failures.dart';
import 'package:shap/core/usecases/usecase.dart';
import 'package:shap/features/login/domain/repositories/login_repository.dart';

class LoginGoogle implements UseCase<Map<String,dynamic>?, NoParams> {
  final LoginRepository repository;

  LoginGoogle(this.repository);

  @override
  Future<Either<Failure, Map<String,dynamic>?>> call(NoParams params) async {
    return await repository.login_google() ;
  }
}