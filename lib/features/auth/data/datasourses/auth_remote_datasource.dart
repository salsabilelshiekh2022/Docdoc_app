import 'package:dartz/dartz.dart';
import 'package:doc_app/core/database/network/api_consumer.dart';
import 'package:doc_app/core/database/network/end_points.dart';
import 'package:doc_app/core/errors/failures.dart';
import 'package:doc_app/features/auth/data/models/user_model/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, UserModel>> login({required email, required password});
  Future<Either<Failure, UserModel>> register(
      {required email, required password, required phone, required name});
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiConsumer api;

  AuthRemoteDatasourceImpl({required this.api});
  @override
  Future<Either<Failure, UserModel>> login(
      {required email, required password}) async {
    try {
      final response = await api.post(path: EndPoint.login, data: {
        "email": email,
        "password": password,
      });
      final user = UserModel.fromJson(response);
      return Right(user);
    } on ServerFailure catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
      {required email,
      required password,
      required phone,
      required name}) async {
    try {
      final response = await api.post(path: EndPoint.register, data: {
        "name": name,
        "email": email,
        "phone": phone,
        "gender": 0,
        "password": password,
        "password_confirmation": password
      });
      final user = UserModel.fromJson(response);
      return Right(user);
    } on ServerFailure catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}