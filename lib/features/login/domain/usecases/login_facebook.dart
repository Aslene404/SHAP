import 'package:dartz/dartz.dart';
import 'package:shap/core/error/failures.dart';
import 'package:shap/core/usecases/usecase.dart';
import 'package:shap/features/login/domain/repositories/login_repository.dart';

class LoginFacebook implements UseCase<Map<String, dynamic>?, NoParams> {
  final LoginRepository repository;

  LoginFacebook(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>?>> call(NoParams params) async {
    return await repository.login_facebook() ;
  }
}