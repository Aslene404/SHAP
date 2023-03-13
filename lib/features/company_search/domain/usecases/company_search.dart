import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shap/core/error/failures.dart';
import 'package:shap/core/usecases/usecase.dart';
import 'package:shap/features/company_search/domain/repositories/company_search_repository.dart';

class CompanySearch implements UseCase<Map<String,dynamic>?, Params> {
  final CompanySearchRepository repository;

  CompanySearch(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>?>> call(Params params) async {
    return await repository.company_search(params.company);
  }


}

class Params extends Equatable {
  final Map<String,dynamic> company;

  Params({required this.company});

  @override
  List<Object> get props => [company];
}