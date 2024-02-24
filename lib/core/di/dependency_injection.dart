import 'package:dio/dio.dart';
import 'package:doc_app/core/database/network/api_consumer.dart';
import 'package:doc_app/core/database/network/dio_consumer.dart';
import 'package:doc_app/core/database/network/network_info.dart';
import 'package:doc_app/features/auth/data/datasourses/auth_remote_datasource.dart';
import 'package:doc_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:doc_app/features/auth/domain/usecases/login.dart';
import 'package:doc_app/features/auth/domain/usecases/register.dart';
import 'package:doc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/auth/data/datasourses/auth_local_datasource.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../database/cache/cache_helper.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerFactory(() => AuthBloc(login: getIt(), register: getIt()));

  getIt.registerLazySingleton(() => LoginUsecase(repository: getIt()));
  getIt.registerLazySingleton(() => RegisterUsecase(repository: getIt()));

  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      remoteDatasource: getIt(),
      localDatasource: getIt(),
      networrkInfo: getIt()));

  getIt.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(api: getIt()));

  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton(() => Dio());

  getIt.registerLazySingleton<AuthLocalDatasource>(
      () => AuthLocalDatasourceImpl(cacheHelper: getIt()));

  getIt.registerSingleton<CacheHelper>(CacheHelper());

  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: getIt()));

  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
