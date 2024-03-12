import 'package:dartz/dartz.dart';
import 'package:doc_app/core/errors/failures.dart';
import 'package:doc_app/core/usecases/usecase.dart';
import 'package:doc_app/features/auth/domain/entities/user.dart';
import 'package:doc_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class RegisterUsecase implements UseCase<User, RegisterParams> {
  final AuthRepository repository;

  RegisterUsecase({required this.repository});
  @override
  Future<Either<Failure, User>> call(RegisterParams params) async {
    return await repository.register(
        email: params.email,
        password: params.password,
        name: params.name,
        phone: params.phone);
  }
}

class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String name;
  final String phone;

  const RegisterParams(
      {required this.email,
      required this.password,
      required this.name,
      required this.phone});

  @override
  List<Object> get props => [email, password, email, phone];
}
