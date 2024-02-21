import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String? token;
  final String? username;

  const UserData({this.token, this.username});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        token: json['token'] as String?,
        username: json['username'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'username': username,
      };

  @override
  List<Object?> get props => [token, username];
}
