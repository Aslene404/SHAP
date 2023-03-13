import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shap/core/error/failures.dart';
import 'package:shap/core/usecases/usecase.dart';
import 'package:shap/features/company_search/domain/repositories/company_search_repository.dart';

class CompanyContact implements UseCase<Map<String,dynamic>?, Params> {
  final CompanySearchRepository repository;

  CompanyContact(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>?>> call(Params params) async {
    return await repository.company_contact(params.company_number);
  }


}

class Params extends Equatable {
  final String company_number;

  Params({required this.company_number});

  @override
  List<Object> get props => [company_number];
}