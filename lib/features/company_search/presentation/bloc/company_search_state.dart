import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shap/features/company_search/domain/entities/company.dart';
import 'package:shap/features/company_search/domain/usecases/company_search.dart';

@immutable
abstract class CompanySearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends CompanySearchState {}

class Loading extends CompanySearchState {}

class Loaded extends CompanySearchState {
  final  company;

  Loaded({required this.company});

  @override
  List<Object> get props => [company];
}

class Error extends CompanySearchState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}