import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shap/core/error/failures.dart';


import 'package:shap/features/company_search/domain/usecases/company_contact.dart' as cc;
import 'package:shap/features/company_search/domain/usecases/company_detail.dart' as cd;
import 'package:shap/features/company_search/domain/usecases/company_documents.dart' as cdoc ;
import 'package:shap/features/company_search/domain/usecases/company_insolvency.dart' as ci;
import 'package:shap/features/company_search/domain/usecases/company_notices.dart' as cn;
import 'package:shap/features/company_search/domain/usecases/company_officers.dart' as co;
import 'package:shap/features/company_search/domain/usecases/company_stats.dart' as st;
import 'package:shap/features/company_search/domain/usecases/company_branches.dart' as br;

import 'package:shap/features/company_search/domain/usecases/company_search.dart' as cs;
import 'package:shap/features/company_search/domain/usecases/company_sheets.dart' as csh;




import '../../domain/usecases/company_branches.dart';
import '../../domain/usecases/company_contact.dart';
import '../../domain/usecases/company_detail.dart';
import '../../domain/usecases/company_documents.dart';
import '../../domain/usecases/company_insolvency.dart';
import '../../domain/usecases/company_notices.dart';
import '../../domain/usecases/company_officers.dart';
import '../../domain/usecases/company_search.dart';
import '../../domain/usecases/company_sheets.dart';
import '../../domain/usecases/company_stats.dart';
import 'company_search_event.dart';
import 'company_search_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input.';

class CompanySearchBloc extends Bloc<CompanySearchEvent, CompanySearchState> {
  final CompanySearch company_search;
  final CompanyDetail company_detail;
  final CompanyContact company_contact;
  final CompanyInsolvency company_insolvency;
  final CompanyNotices company_notices;
  final CompanyOfficers company_officers;
  final CompanyStats company_stats;
  final CompanyDocuments company_documents;
  final CompanySheets company_sheets;

  CompanySearchBloc({
    required CompanySearch concrete,required CompanyDetail detail,required CompanyContact contact,required CompanyInsolvency insolvency,required CompanyNotices notices,required CompanyOfficers officers,
    required CompanyDocuments documents,required CompanySheets sheets,required CompanyStats stats})  : assert(concrete != null),
        assert(detail != null),assert(contact != null),assert(insolvency != null),assert(notices != null),assert(officers != null),assert(documents != null),assert(sheets != null),assert(stats != null),
        
        company_search = concrete,company_detail=detail,company_contact=contact,
        company_insolvency=insolvency,company_notices=notices,company_officers=officers,company_documents=documents,company_sheets=sheets,company_stats=stats,super(Empty());

  @override
  CompanySearchState get initialState => Empty();

  @override
  Stream<CompanySearchState> mapEventToState(
      CompanySearchEvent event,
      ) async* {
    if (event is CompanySearchProcess) {
      final inputSearchString = event.searchString;
      final inputLegalForm = event.legalForm;
      final inputStates = event.states;
      final inputBranches = event.branches;
      final inputCapital = event.capital;
      final inputZipCode = event.zipCode;
      String value='{"legal_form" : $inputLegalForm,"states" : $inputStates,"branches" : $inputBranches,"capital" : "$inputCapital","zip_code" : "$inputZipCode", "searchString":"$inputSearchString"}';
      print(value);
      Map<String,dynamic> valueMap = jsonDecode(value) ;
      print(valueMap);
      yield Loading();
          final failureOrSuccess =
          await company_search(cs.Params(company: valueMap));



          yield* _eitherLoadedOrErrorState(failureOrSuccess);

            };
    if (event is CompanyDetailProcess) {
      final inputCompanyId = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_detail(cd.Params(company_id: inputCompanyId));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyContactProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_contact(cc.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyInsolvencyProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_insolvency(ci.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyNoticesProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_notices(cn.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyOfficersProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_officers(co.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanyDocumentsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_documents(cdoc.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanySheetsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_sheets(csh.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyStatsProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_stats(st.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    

    }
  }
class CompanySearchBloc_officers extends Bloc<CompanySearchEvent, CompanySearchState> {
  final CompanySearch company_search;
  final CompanyDetail company_detail;
  final CompanyContact company_contact;
  final CompanyInsolvency company_insolvency;
  final CompanyNotices company_notices;
  final CompanyOfficers company_officers;
  final CompanyStats company_stats;
  final CompanyDocuments company_documents;
  final CompanySheets company_sheets;

  CompanySearchBloc_officers({
    required CompanySearch concrete,required CompanyDetail detail,required CompanyContact contact,required CompanyInsolvency insolvency,required CompanyNotices notices,required CompanyOfficers officers,
    required CompanyDocuments documents,required CompanySheets sheets,required CompanyStats stats})  : assert(concrete != null),
        assert(detail != null),assert(contact != null),assert(insolvency != null),assert(notices != null),assert(officers != null),assert(documents != null),assert(sheets != null),assert(stats != null),

        company_search = concrete,company_detail=detail,company_contact=contact,
        company_insolvency=insolvency,company_notices=notices,company_officers=officers,company_documents=documents,company_sheets=sheets,company_stats=stats,super(Empty());

  @override
  CompanySearchState get initialState => Empty();

  @override
  Stream<CompanySearchState> mapEventToState(
      CompanySearchEvent event,
      ) async* {
    if (event is CompanySearchProcess) {
      final inputSearchString = event.searchString;
      final inputLegalForm = event.legalForm;
      final inputStates = event.states;
      final inputBranches = event.branches;
      final inputCapital = event.capital;
      final inputZipCode = event.zipCode;
      String value='{"legal_form" : [$inputLegalForm],"states" : [$inputStates],"branches" : [$inputBranches],"capital" : [$inputCapital],"zip_code" : [$inputZipCode], "searchString":"$inputSearchString"}';
      print(value);
      Map<String,dynamic> valueMap = jsonDecode(value) ;
      print(valueMap);
      yield Loading();
      final failureOrSuccess =
      await company_search(cs.Params(company: valueMap));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyDetailProcess) {
      final inputCompanyId = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_detail(cd.Params(company_id: inputCompanyId));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyContactProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_contact(cc.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyInsolvencyProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_insolvency(ci.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyNoticesProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_notices(cn.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyOfficersProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_officers(co.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanyDocumentsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_documents(cdoc.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanySheetsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_sheets(csh.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyStatsProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_stats(st.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };



  }
}
class CompanySearchBloc_contact extends Bloc<CompanySearchEvent, CompanySearchState> {
  final CompanySearch company_search;
  final CompanyDetail company_detail;
  final CompanyContact company_contact;
  final CompanyInsolvency company_insolvency;
  final CompanyNotices company_notices;
  final CompanyOfficers company_officers;
  final CompanyStats company_stats;
  final CompanyDocuments company_documents;
  final CompanySheets company_sheets;

  CompanySearchBloc_contact({
    required CompanySearch concrete,required CompanyDetail detail,required CompanyContact contact,required CompanyInsolvency insolvency,required CompanyNotices notices,required CompanyOfficers officers,
    required CompanyDocuments documents,required CompanySheets sheets,required CompanyStats stats})  : assert(concrete != null),
        assert(detail != null),assert(contact != null),assert(insolvency != null),assert(notices != null),assert(officers != null),assert(documents != null),assert(sheets != null),assert(stats != null),

        company_search = concrete,company_detail=detail,company_contact=contact,
        company_insolvency=insolvency,company_notices=notices,company_officers=officers,company_documents=documents,company_sheets=sheets,company_stats=stats,super(Empty());

  @override
  CompanySearchState get initialState => Empty();

  @override
  Stream<CompanySearchState> mapEventToState(
      CompanySearchEvent event,
      ) async* {
    if (event is CompanySearchProcess) {
      final inputSearchString = event.searchString;
      final inputLegalForm = event.legalForm;
      final inputStates = event.states;
      final inputBranches = event.branches;
      final inputCapital = event.capital;
      final inputZipCode = event.zipCode;
      String value='{"legal_form" : [$inputLegalForm],"states" : [$inputStates],"branches" : [$inputBranches],"capital" : [$inputCapital],"zip_code" : [$inputZipCode], "searchString":"$inputSearchString"}';
      print(value);
      Map<String,dynamic> valueMap = jsonDecode(value) ;
      print(valueMap);
      yield Loading();
      final failureOrSuccess =
      await company_search(cs.Params(company: valueMap));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyDetailProcess) {
      final inputCompanyId = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_detail(cd.Params(company_id: inputCompanyId));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyContactProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_contact(cc.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyInsolvencyProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_insolvency(ci.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyNoticesProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_notices(cn.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyOfficersProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_officers(co.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanyDocumentsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_documents(cdoc.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanySheetsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_sheets(csh.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyStatsProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_stats(st.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };



  }
}
class CompanySearchBloc_doc extends Bloc<CompanySearchEvent, CompanySearchState> {
  final CompanySearch company_search;
  final CompanyDetail company_detail;
  final CompanyContact company_contact;
  final CompanyInsolvency company_insolvency;
  final CompanyNotices company_notices;
  final CompanyOfficers company_officers;
  final CompanyStats company_stats;
  final CompanyDocuments company_documents;
  final CompanySheets company_sheets;

  CompanySearchBloc_doc({
    required CompanySearch concrete,required CompanyDetail detail,required CompanyContact contact,required CompanyInsolvency insolvency,required CompanyNotices notices,required CompanyOfficers officers,
    required CompanyDocuments documents,required CompanySheets sheets,required CompanyStats stats})  : assert(concrete != null),
        assert(detail != null),assert(contact != null),assert(insolvency != null),assert(notices != null),assert(officers != null),assert(documents != null),assert(sheets != null),assert(stats != null),

        company_search = concrete,company_detail=detail,company_contact=contact,
        company_insolvency=insolvency,company_notices=notices,company_officers=officers,company_documents=documents,company_sheets=sheets,company_stats=stats,super(Empty());

  @override
  CompanySearchState get initialState => Empty();

  @override
  Stream<CompanySearchState> mapEventToState(
      CompanySearchEvent event,
      ) async* {
    if (event is CompanySearchProcess) {
      final inputSearchString = event.searchString;
      final inputLegalForm = event.legalForm;
      final inputStates = event.states;
      final inputBranches = event.branches;
      final inputCapital = event.capital;
      final inputZipCode = event.zipCode;
      String value='{"legal_form" : [$inputLegalForm],"states" : [$inputStates],"branches" : [$inputBranches],"capital" : [$inputCapital],"zip_code" : [$inputZipCode], "searchString":"$inputSearchString"}';
      print(value);
      Map<String,dynamic> valueMap = jsonDecode(value) ;
      print(valueMap);
      yield Loading();
      final failureOrSuccess =
      await company_search(cs.Params(company: valueMap));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyDetailProcess) {
      final inputCompanyId = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_detail(cd.Params(company_id: inputCompanyId));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyContactProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_contact(cc.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyInsolvencyProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_insolvency(ci.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyNoticesProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_notices(cn.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyOfficersProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_officers(co.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanyDocumentsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_documents(cdoc.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanySheetsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_sheets(csh.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyStatsProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_stats(st.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };



  }
}
class CompanySearchBloc_notices extends Bloc<CompanySearchEvent, CompanySearchState> {
  final CompanySearch company_search;
  final CompanyDetail company_detail;
  final CompanyContact company_contact;
  final CompanyInsolvency company_insolvency;
  final CompanyNotices company_notices;
  final CompanyOfficers company_officers;
  final CompanyStats company_stats;
  final CompanyDocuments company_documents;
  final CompanySheets company_sheets;

  CompanySearchBloc_notices({
    required CompanySearch concrete,required CompanyDetail detail,required CompanyContact contact,required CompanyInsolvency insolvency,required CompanyNotices notices,required CompanyOfficers officers,
    required CompanyDocuments documents,required CompanySheets sheets,required CompanyStats stats})  : assert(concrete != null),
        assert(detail != null),assert(contact != null),assert(insolvency != null),assert(notices != null),assert(officers != null),assert(documents != null),assert(sheets != null),assert(stats != null),

        company_search = concrete,company_detail=detail,company_contact=contact,
        company_insolvency=insolvency,company_notices=notices,company_officers=officers,company_documents=documents,company_sheets=sheets,company_stats=stats,super(Empty());

  @override
  CompanySearchState get initialState => Empty();

  @override
  Stream<CompanySearchState> mapEventToState(
      CompanySearchEvent event,
      ) async* {
    if (event is CompanySearchProcess) {
      final inputSearchString = event.searchString;
      final inputLegalForm = event.legalForm;
      final inputStates = event.states;
      final inputBranches = event.branches;
      final inputCapital = event.capital;
      final inputZipCode = event.zipCode;
      String value='{"legal_form" : [$inputLegalForm],"states" : [$inputStates],"branches" : [$inputBranches],"capital" : [$inputCapital],"zip_code" : [$inputZipCode], "searchString":"$inputSearchString"}';
      print(value);
      Map<String,dynamic> valueMap = jsonDecode(value) ;
      print(valueMap);
      yield Loading();
      final failureOrSuccess =
      await company_search(cs.Params(company: valueMap));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyDetailProcess) {
      final inputCompanyId = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_detail(cd.Params(company_id: inputCompanyId));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyContactProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_contact(cc.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyInsolvencyProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_insolvency(ci.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyNoticesProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_notices(cn.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyOfficersProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_officers(co.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanyDocumentsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_documents(cdoc.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanySheetsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_sheets(csh.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyStatsProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_stats(st.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };



  }
}
class CompanySearchBloc_insolv extends Bloc<CompanySearchEvent, CompanySearchState> {
  final CompanySearch company_search;
  final CompanyDetail company_detail;
  final CompanyContact company_contact;
  final CompanyInsolvency company_insolvency;
  final CompanyNotices company_notices;
  final CompanyOfficers company_officers;
  final CompanyStats company_stats;
  final CompanyDocuments company_documents;
  final CompanySheets company_sheets;

  CompanySearchBloc_insolv({
    required CompanySearch concrete,required CompanyDetail detail,required CompanyContact contact,required CompanyInsolvency insolvency,required CompanyNotices notices,required CompanyOfficers officers,
    required CompanyDocuments documents,required CompanySheets sheets,required CompanyStats stats})  : assert(concrete != null),
        assert(detail != null),assert(contact != null),assert(insolvency != null),assert(notices != null),assert(officers != null),assert(documents != null),assert(sheets != null),assert(stats != null),

        company_search = concrete,company_detail=detail,company_contact=contact,
        company_insolvency=insolvency,company_notices=notices,company_officers=officers,company_documents=documents,company_sheets=sheets,company_stats=stats,super(Empty());

  @override
  CompanySearchState get initialState => Empty();

  @override
  Stream<CompanySearchState> mapEventToState(
      CompanySearchEvent event,
      ) async* {
    if (event is CompanySearchProcess) {
      final inputSearchString = event.searchString;
      final inputLegalForm = event.legalForm;
      final inputStates = event.states;
      final inputBranches = event.branches;
      final inputCapital = event.capital;
      final inputZipCode = event.zipCode;
      String value='{"legal_form" : [$inputLegalForm],"states" : [$inputStates],"branches" : [$inputBranches],"capital" : [$inputCapital],"zip_code" : [$inputZipCode], "searchString":"$inputSearchString"}';
      print(value);
      Map<String,dynamic> valueMap = jsonDecode(value) ;
      print(valueMap);
      yield Loading();
      final failureOrSuccess =
      await company_search(cs.Params(company: valueMap));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyDetailProcess) {
      final inputCompanyId = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_detail(cd.Params(company_id: inputCompanyId));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyContactProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_contact(cc.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyInsolvencyProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_insolvency(ci.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyNoticesProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_notices(cn.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyOfficersProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_officers(co.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanyDocumentsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_documents(cdoc.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanySheetsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_sheets(csh.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyStatsProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_stats(st.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };



  }
}
class CompanySearchBloc_sheets extends Bloc<CompanySearchEvent, CompanySearchState> {
  final CompanySearch company_search;
  final CompanyDetail company_detail;
  final CompanyContact company_contact;
  final CompanyInsolvency company_insolvency;
  final CompanyNotices company_notices;
  final CompanyOfficers company_officers;
  final CompanyStats company_stats;
  final CompanyDocuments company_documents;
  final CompanySheets company_sheets;

  CompanySearchBloc_sheets({
    required CompanySearch concrete,required CompanyDetail detail,required CompanyContact contact,required CompanyInsolvency insolvency,required CompanyNotices notices,required CompanyOfficers officers,
    required CompanyDocuments documents,required CompanySheets sheets,required CompanyStats stats})  : assert(concrete != null),
        assert(detail != null),assert(contact != null),assert(insolvency != null),assert(notices != null),assert(officers != null),assert(documents != null),assert(sheets != null),assert(stats != null),

        company_search = concrete,company_detail=detail,company_contact=contact,
        company_insolvency=insolvency,company_notices=notices,company_officers=officers,company_documents=documents,company_sheets=sheets,company_stats=stats,super(Empty());

  @override
  CompanySearchState get initialState => Empty();

  @override
  Stream<CompanySearchState> mapEventToState(
      CompanySearchEvent event,
      ) async* {
    if (event is CompanySearchProcess) {
      final inputSearchString = event.searchString;
      final inputLegalForm = event.legalForm;
      final inputStates = event.states;
      final inputBranches = event.branches;
      final inputCapital = event.capital;
      final inputZipCode = event.zipCode;
      String value='{"legal_form" : [$inputLegalForm],"states" : [$inputStates],"branches" : [$inputBranches],"capital" : [$inputCapital],"zip_code" : [$inputZipCode], "searchString":"$inputSearchString"}';
      print(value);
      Map<String,dynamic> valueMap = jsonDecode(value) ;
      print(valueMap);
      yield Loading();
      final failureOrSuccess =
      await company_search(cs.Params(company: valueMap));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyDetailProcess) {
      final inputCompanyId = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_detail(cd.Params(company_id: inputCompanyId));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyContactProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_contact(cc.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyInsolvencyProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_insolvency(ci.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyNoticesProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_notices(cn.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyOfficersProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_officers(co.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanyDocumentsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_documents(cdoc.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanySheetsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_sheets(csh.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyStatsProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_stats(st.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };



  }
}
class CompanySearchBloc_stats extends Bloc<CompanySearchEvent, CompanySearchState> {
  final CompanySearch company_search;
  final CompanyDetail company_detail;
  final CompanyContact company_contact;
  final CompanyInsolvency company_insolvency;
  final CompanyNotices company_notices;
  final CompanyOfficers company_officers;
  final CompanyStats company_stats;
  final CompanyDocuments company_documents;
  final CompanySheets company_sheets;

  CompanySearchBloc_stats({
    required CompanySearch concrete,required CompanyDetail detail,required CompanyContact contact,required CompanyInsolvency insolvency,required CompanyNotices notices,required CompanyOfficers officers,
    required CompanyDocuments documents,required CompanySheets sheets,required CompanyStats stats})  : assert(concrete != null),
        assert(detail != null),assert(contact != null),assert(insolvency != null),assert(notices != null),assert(officers != null),assert(documents != null),assert(sheets != null),assert(stats != null),

        company_search = concrete,company_detail=detail,company_contact=contact,
        company_insolvency=insolvency,company_notices=notices,company_officers=officers,company_documents=documents,company_sheets=sheets,company_stats=stats,super(Empty());

  @override
  CompanySearchState get initialState => Empty();

  @override
  Stream<CompanySearchState> mapEventToState(
      CompanySearchEvent event,
      ) async* {
    if (event is CompanySearchProcess) {
      final inputSearchString = event.searchString;
      final inputLegalForm = event.legalForm;
      final inputStates = event.states;
      final inputBranches = event.branches;
      final inputCapital = event.capital;
      final inputZipCode = event.zipCode;
      String value='{"legal_form" : [$inputLegalForm],"states" : [$inputStates],"branches" : [$inputBranches],"capital" : [$inputCapital],"zip_code" : [$inputZipCode], "searchString":"$inputSearchString"}';
      print(value);
      Map<String,dynamic> valueMap = jsonDecode(value) ;
      print(valueMap);
      yield Loading();
      final failureOrSuccess =
      await company_search(cs.Params(company: valueMap));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyDetailProcess) {
      final inputCompanyId = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_detail(cd.Params(company_id: inputCompanyId));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyContactProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_contact(cc.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyInsolvencyProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_insolvency(ci.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyNoticesProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_notices(cn.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyOfficersProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_officers(co.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanyDocumentsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_documents(cdoc.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanySheetsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_sheets(csh.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyStatsProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_stats(st.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };



  }
}
class CompanySearchBloc_branches extends Bloc<CompanySearchEvent, CompanySearchState> {
  final CompanySearch company_search;
  final CompanyDetail company_detail;
  final CompanyContact company_contact;
  final CompanyInsolvency company_insolvency;
  final CompanyNotices company_notices;
  final CompanyOfficers company_officers;
  final CompanyStats company_stats;
  final CompanyBranches company_branches;
  final CompanyDocuments company_documents;
  final CompanySheets company_sheets;

  CompanySearchBloc_branches({
    required CompanySearch concrete,required CompanyDetail detail,required CompanyContact contact,required CompanyInsolvency insolvency,required CompanyNotices notices,required CompanyOfficers officers,
    required CompanyDocuments documents,required CompanySheets sheets,required CompanyStats stats,required CompanyBranches branches})  : assert(concrete != null),
        assert(detail != null),assert(contact != null),assert(insolvency != null),assert(notices != null),assert(officers != null),assert(documents != null),assert(sheets != null),assert(stats != null),assert(branches != null),

        company_search = concrete,company_detail=detail,company_contact=contact,
        company_insolvency=insolvency,company_notices=notices,company_officers=officers,company_documents=documents,company_sheets=sheets,company_stats=stats,company_branches=branches,super(Empty());

  @override
  CompanySearchState get initialState => Empty();

  @override
  Stream<CompanySearchState> mapEventToState(
      CompanySearchEvent event,
      ) async* {
    if (event is CompanySearchProcess) {
      final inputSearchString = event.searchString;
      final inputLegalForm = event.legalForm;
      final inputStates = event.states;
      final inputBranches = event.branches;
      final inputCapital = event.capital;
      final inputZipCode = event.zipCode;
      String value='{"legal_form" : [$inputLegalForm],"states" : [$inputStates],"branches" : [$inputBranches],"capital" : [$inputCapital],"zip_code" : [$inputZipCode], "searchString":"$inputSearchString"}';
      print(value);
      Map<String,dynamic> valueMap = jsonDecode(value) ;
      print(valueMap);
      yield Loading();
      final failureOrSuccess =
      await company_search(cs.Params(company: valueMap));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyDetailProcess) {
      final inputCompanyId = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_detail(cd.Params(company_id: inputCompanyId));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyContactProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_contact(cc.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyInsolvencyProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_insolvency(ci.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyNoticesProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_notices(cn.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyOfficersProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_officers(co.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanyDocumentsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_documents(cdoc.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    if (event is CompanySheetsProcess) {
      final inputCompanyNumber = event.company_id;


      yield Loading();
      final failureOrSuccess =
      await company_sheets(csh.Params(company_id: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyStatsProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_stats(st.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is CompanyBranchesProcess) {
      final inputCompanyNumber = event.company_number;


      yield Loading();
      final failureOrSuccess =
      await company_branches(br.Params(company_number: inputCompanyNumber));



      yield* _eitherLoadedOrErrorState_list(failureOrSuccess);

    };



  }
}

  Stream<CompanySearchState> _eitherLoadedOrErrorState(
      Either<Failure, Map<String, dynamic>?> failureOrSuccess,
      ) async* {
    yield failureOrSuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (valueMap) => Loaded(company:valueMap),
    );
  }
  Stream<CompanySearchState> _eitherLoadedOrErrorState_list(
    Either<Failure, List<dynamic>?> failureOrSuccess,
    ) async* {
  yield failureOrSuccess.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (valueMap) => Loaded(company:valueMap),
  );
}



  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.toString(); //substring(14,failure.toString().length-1);
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
