import 'package:dartz/dartz.dart';
import 'package:doc_app/core/errors/failures.dart';
import 'package:doc_app/core/usecases/usecase.dart';
import 'package:doc_app/features/auth/domain/entities/user.dart';
import 'package:doc_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class Register implements UseCase<User, Params> {
  final AuthRepository repository;

  Register({required this.repository});
  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.register(
        email: params.email,
        password: params.password,
        name: params.name,
        phone: params.phone);
  }
}

class Params extends Equatable {
  final String email;
  final String password;
  final String name;
  final String phone;

  const Params(
      {required this.email,
      required this.password,
      required this.name,
      required this.phone});

  @override
  List<Object> get props => [email, password, email, phone];
}
