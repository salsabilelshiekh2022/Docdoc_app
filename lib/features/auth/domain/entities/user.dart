import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String name;
  final String phone;
  final String password;

  const User({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
  });

  @override
  List<Object?> get props => [email, name, phone, password];
}
