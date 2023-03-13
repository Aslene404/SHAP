import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';



abstract class RegisterRepository {
  Future<Either<Failure, Map<String,dynamic>?>> register(Map<String, dynamic> user);
}