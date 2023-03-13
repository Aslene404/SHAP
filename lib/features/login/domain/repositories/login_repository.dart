import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/error/failures.dart';



abstract class LoginRepository {
  Future<Either<Failure, Map<String,dynamic>?>> login(Map<String,dynamic> user);
  Future<Either<Failure, Map<String,dynamic>?>> login_facebook();
  Future<Either<Failure, Map<String,dynamic>?>> login_linked_in(Map<String,dynamic> user);
  Future<Either<Failure, Map<String,dynamic>?>> login_xing();
  Future<Either<Failure, Map<String,dynamic>?>> login_google();
}