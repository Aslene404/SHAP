import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CompanySearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CompanySearchProcess extends CompanySearchEvent {
  final String searchString;
  final String legalForm;
  final String states;
  final String branches;
  final String capital;
  final String zipCode;


  CompanySearchProcess(this.searchString,this.legalForm, this.states, this.branches, this.capital, this.zipCode);

  @override
  List<Object> get props => [searchString,legalForm,states,branches,capital,zipCode];
}
class CompanyContactProcess extends CompanySearchEvent {
  final String company_number;


  CompanyContactProcess(this.company_number);

  @override
  List<Object> get props => [company_number];
}
class CompanyDetailProcess extends CompanySearchEvent {
  final String company_id;


  CompanyDetailProcess(this.company_id);

  @override
  List<Object> get props => [company_id];
}
class CompanyInsolvencyProcess extends CompanySearchEvent {
  final String company_number;


  CompanyInsolvencyProcess(this.company_number);

  @override
  List<Object> get props => [company_number];
}
class CompanyNoticesProcess extends CompanySearchEvent {
  final String company_number;


  CompanyNoticesProcess(this.company_number);

  @override
  List<Object> get props => [company_number];
}
class CompanyOfficersProcess extends CompanySearchEvent {
  final String company_number;


  CompanyOfficersProcess(this.company_number);

  @override
  List<Object> get props => [company_number];
}

class CompanyDocumentsProcess extends CompanySearchEvent {
  final String company_id;


  CompanyDocumentsProcess(this.company_id);

  @override
  List<Object> get props => [company_id];
}

class CompanySheetsProcess extends CompanySearchEvent {
  final String company_id;


  CompanySheetsProcess(this.company_id);

  @override
  List<Object> get props => [company_id];
}
class CompanyStatsProcess extends CompanySearchEvent {
  final String company_number;


  CompanyStatsProcess(this.company_number);

  @override
  List<Object> get props => [company_number];
}
class CompanyBranchesProcess extends CompanySearchEvent {
  final String company_number;


  CompanyBranchesProcess(this.company_number);

  @override
  List<Object> get props => [company_number];
}

