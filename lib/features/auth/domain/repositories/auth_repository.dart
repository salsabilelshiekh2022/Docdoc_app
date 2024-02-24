import 'package:dartz/dartz.dart';
import 'package:doc_app/features/auth/domain/entities/user.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(
      {required String email, required String password});
  Future<Either<Failure, User>> register(
      {required String name,
      required String email,
      required String phone,
      required String password});
}
