import 'package:dartz/dartz.dart';
import 'package:shap/core/error/failures.dart';
import 'package:shap/core/usecases/usecase.dart';
import 'package:shap/features/login/domain/repositories/login_repository.dart';

class LoginXing implements UseCase<Map<String, dynamic>?, NoParams> {
  final LoginRepository repository;

  LoginXing(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>?>> call(NoParams params) async {
    return await repository.login_xing() ;
  }
}