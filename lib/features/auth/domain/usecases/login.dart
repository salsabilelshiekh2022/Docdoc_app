import 'package:dartz/dartz.dart';
import 'package:doc_app/core/errors/failures.dart';
import 'package:doc_app/core/usecases/usecase.dart';
import 'package:doc_app/features/auth/domain/entities/user.dart';
import 'package:doc_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class Login implements UseCase<User, Params> {
  final AuthRepository repository;

  Login({required this.repository});
  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.login(
        email: params.email, password: params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
