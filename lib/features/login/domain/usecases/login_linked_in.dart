import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shap/core/error/failures.dart';
import 'package:shap/core/usecases/usecase.dart';
import 'package:shap/features/login/domain/repositories/login_repository.dart';

class LoginLinkedIn implements UseCase<Map<String, dynamic>?, Params> {
  final LoginRepository repository;

  LoginLinkedIn(this.repository);

  @override

  Future<Either<Failure, Map<String, dynamic>?>> call(Params params) async {
    return await repository.login_linked_in(params.user);
  }

}
class Params extends Equatable {
  final Map<String,dynamic> user;

  Params({required this.user});

  @override
  List<Object> get props => [user];
}