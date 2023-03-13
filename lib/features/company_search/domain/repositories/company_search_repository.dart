import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/error/failures.dart';



abstract class CompanySearchRepository {
  Future<Either<Failure, Map<String, dynamic>?>> company_search(Map<String, dynamic> company);
  Future<Either<Failure, Map<String, dynamic>?>> company_detail(String company_id);
  Future<Either<Failure, Map<String, dynamic>?>> company_contact(String company_number);
  Future<Either<Failure, Map<String, dynamic>?>> company_insolvency(String company_number);
  Future<Either<Failure, Map<String, dynamic>?>> company_notices(String company_number);
  Future<Either<Failure, Map<String, dynamic>?>> company_officers(String company_number);
  Future<Either<Failure, Map<String, dynamic>?>> company_documents(String company_id);
  Future<Either<Failure, Map<String, dynamic>?>> company_sheets(String company_id);
  Future<Either<Failure, Map<String, dynamic>?>> company_stats(String company_number);
  Future<Either<Failure, List<dynamic>?>> company_branches(String company_number);
}