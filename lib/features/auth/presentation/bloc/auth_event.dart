part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class UserLogin extends AuthEvent {
  final String email;
  final String password;

  const UserLogin({required this.email, required this.password});
}

class UserRegister extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String phone;

  const UserRegister(
      {required this.email,
      required this.password,
      required this.name,
      required this.phone});
}
