import '../../../domain/entities/user.dart';
import 'user_data.dart';

class UserModel extends User {
  final String? message;
  final UserData? data;
  final bool? status;
  final int? code;

  const UserModel({this.message, this.data, this.status, this.code}) : super();

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : UserData.fromJson(json['data'] as Map<String, dynamic>),
        status: json['status'] as bool?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
        'status': status,
        'code': code,
      };

  @override
  List<Object?> get props => [message, data, status, code];
}
