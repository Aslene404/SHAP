

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shap/core/error/failures.dart';
import 'package:shap/core/usecases/usecase.dart';
import 'package:shap/features/register/domain/repositories/register_repository.dart';

class Register implements UseCase<Map<String,dynamic>?, Params> {
  final RegisterRepository repository;

  Register(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>?>> call(Params params) async {
    return await repository.register(params.user);
  }


}

class Params extends Equatable {
  final Map<String,dynamic> user;

  Params({required this.user});

  @override
  List<Object> get props => [user];
}