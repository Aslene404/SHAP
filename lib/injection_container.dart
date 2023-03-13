import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:shap/core/network/network_info.dart';
import 'package:shap/features/company_search/domain/usecases/company_branches.dart';
import 'package:shap/features/company_search/domain/usecases/company_contact.dart';
import 'package:shap/features/company_search/domain/usecases/company_detail.dart';
import 'package:shap/features/company_search/domain/usecases/company_documents.dart';
import 'package:shap/features/company_search/domain/usecases/company_insolvency.dart';
import 'package:shap/features/company_search/domain/usecases/company_notices.dart';
import 'package:shap/features/company_search/domain/usecases/company_officers.dart';
import 'package:shap/features/company_search/domain/usecases/company_sheets.dart';
import 'package:shap/features/company_search/domain/usecases/company_stats.dart';
import 'package:shap/features/login/data/datasources/login_local_data_source.dart';
import 'package:shap/features/login/data/datasources/login_remote_data_source.dart';
import 'package:shap/features/login/data/repositories/login_repository_impl.dart';
import 'package:shap/features/login/domain/repositories/login_repository.dart';
import 'package:shap/features/login/domain/usecases/login.dart';
import 'package:shap/features/login/domain/usecases/login_facebook.dart';
import 'package:shap/features/login/domain/usecases/login_google.dart';
import 'package:shap/features/login/domain/usecases/login_linked_in.dart';
import 'package:shap/features/login/domain/usecases/login_xing.dart';
import 'package:shap/features/login/presentation/bloc/bloc.dart';

import 'package:shap/features/company_search/data/datasources/company_search_local_data_source.dart';
import 'package:shap/features/company_search/data/datasources/company_search_remote_data_source.dart';
import 'package:shap/features/company_search/data/repositories/company_search_repository_impl.dart';
import 'package:shap/features/company_search/domain/repositories/company_search_repository.dart';
import 'package:shap/features/company_search/domain/usecases/company_search.dart';

import 'package:shap/features/company_search/presentation/bloc/bloc.dart';







import 'package:shap/features/register/data/datasources/register_remote_data_source.dart';
import 'package:shap/features/register/data/repositories/register_repository_impl.dart';
import 'package:shap/features/register/domain/repositories/register_repository.dart';
import 'package:shap/features/register/domain/usecases/register.dart';
import 'package:shap/features/register/presentation/bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;


Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
        () => LoginBloc(
      concrete: sl(), google: sl(),facebook: sl(),linkedIn: sl(),xing: sl()

    ),
  );
  sl.registerFactory(
        () => CompanySearchBloc(
      concrete: sl(),
          contact: sl(),
          detail: sl(),
          insolvency: sl(),
          notices: sl(),
          officers: sl(),
          stats: sl(),
          documents: sl(),
          sheets: sl(),

    ),
  );
  sl.registerFactory(
        () => CompanySearchBloc_officers(
      concrete: sl(),
      contact: sl(),
      detail: sl(),
      insolvency: sl(),
      notices: sl(),
      officers: sl(),
      stats: sl(),
      documents: sl(),
      sheets: sl(),

    ),
  );
  sl.registerFactory(
        () => CompanySearchBloc_contact(
      concrete: sl(),
      contact: sl(),
      detail: sl(),
      insolvency: sl(),
      notices: sl(),
      officers: sl(),
      stats: sl(),
      documents: sl(),
      sheets: sl(),

    ),
  );
  sl.registerFactory(
        () => CompanySearchBloc_doc(
      concrete: sl(),
      contact: sl(),
      detail: sl(),
      insolvency: sl(),
      notices: sl(),
      officers: sl(),
      stats: sl(),
      documents: sl(),
      sheets: sl(),

    ),
  );
  sl.registerFactory(
        () => CompanySearchBloc_notices(
      concrete: sl(),
      contact: sl(),
      detail: sl(),
      insolvency: sl(),
      notices: sl(),
      officers: sl(),
      stats: sl(),
      documents: sl(),
      sheets: sl(),

    ),
  );
  sl.registerFactory(
        () => CompanySearchBloc_insolv(
      concrete: sl(),
      contact: sl(),
      detail: sl(),
      insolvency: sl(),
      notices: sl(),
      officers: sl(),
      stats: sl(),
      documents: sl(),
      sheets: sl(),

    ),
  );
  sl.registerFactory(
        () => CompanySearchBloc_sheets(
      concrete: sl(),
      contact: sl(),
      detail: sl(),
      insolvency: sl(),
      notices: sl(),
      officers: sl(),
      stats: sl(),
      documents: sl(),
      sheets: sl(),

    ),
  );
  sl.registerFactory(
        () => CompanySearchBloc_stats(
      concrete: sl(),
      contact: sl(),
      detail: sl(),
      insolvency: sl(),
      notices: sl(),
      officers: sl(),
      stats: sl(),
      documents: sl(),
      sheets: sl(),

    ),
  );
  sl.registerFactory(
        () => CompanySearchBloc_branches(
      concrete: sl(),
      contact: sl(),
      detail: sl(),
      insolvency: sl(),
      notices: sl(),
      officers: sl(),
      stats: sl(),
      documents: sl(),
      sheets: sl(),
      branches: sl(),

    ),
  );
  sl.registerFactory(
        () => RegisterBloc(
      concrete: sl(),

    ),
  );

  // Use cases
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => LoginGoogle(sl()));
  sl.registerLazySingleton(() => LoginFacebook(sl()));
  sl.registerLazySingleton(() => LoginLinkedIn(sl()));
  sl.registerLazySingleton(() => LoginXing(sl()));


  sl.registerLazySingleton(() => CompanySearch(sl()));
  sl.registerLazySingleton(() => CompanyDetail(sl()));
  sl.registerLazySingleton(() => CompanyContact(sl()));
  sl.registerLazySingleton(() => CompanyInsolvency(sl()));
  sl.registerLazySingleton(() => CompanyNotices(sl()));
  sl.registerLazySingleton(() => CompanyOfficers(sl()));
  sl.registerLazySingleton(() => CompanyStats(sl()));
  sl.registerLazySingleton(() => CompanyBranches(sl()));
  sl.registerLazySingleton(() => CompanyDocuments(sl()));
  sl.registerLazySingleton(() => CompanySheets(sl()));

  sl.registerLazySingleton(() => Register(sl()));


  // Repository
  sl.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<CompanySearchRepository>(
        () => CompanySearchRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<RegisterRemoteDataSource>(
        () => RegisterRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<CompanySearchRemoteDataSource>(
        () => CompanySearchRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<LoginLocalDataSource>(
        () => LoginLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<CompanySearchLocalDataSource>(
        () => CompanySearchLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());


  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => Connectivity());

}