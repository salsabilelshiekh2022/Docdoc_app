import 'package:dartz/dartz.dart';

import 'package:doc_app/core/errors/failures.dart';
import 'package:doc_app/features/auth/data/datasourses/auth_local_datasource.dart';
import 'package:doc_app/features/auth/data/datasourses/auth_remote_datasource.dart';

import 'package:doc_app/features/auth/domain/entities/user.dart';

import '../../../../core/database/network/network_info.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;
  final NetworkInfo networrkInfo;

  AuthRepositoryImpl(
      {required this.remoteDatasource,
      required this.localDatasource,
      required this.networrkInfo});
  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    if (await networrkInfo.isConnected) {
      try {
        final user =
            await remoteDatasource.login(email: email, password: password);
        localDatasource.cacheUser(userToCache: user.data!.token!);
        return Right(user);
      } on ServerFailure catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: "No Internet"));
    }
  }

  @override
  Future<Either<Failure, User>> register(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    if (await networrkInfo.isConnected) {
      try {
        final user = await remoteDatasource.register(
            email: email, password: password, phone: phone, name: name);
        localDatasource.cacheUser(userToCache: user.data!.token!);
        return Right(user);
      } on ServerFailure catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(Failure(message: "No Internet"));
    }
  }
}
