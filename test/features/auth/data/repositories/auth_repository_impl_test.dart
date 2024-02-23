import 'package:dartz/dartz.dart';
import 'package:doc_app/core/database/network/network_info.dart';
import 'package:doc_app/core/errors/failures.dart';
import 'package:doc_app/features/auth/data/datasourses/auth_local_datasource.dart';
import 'package:doc_app/features/auth/data/datasourses/auth_remote_datasource.dart';
import 'package:doc_app/features/auth/data/models/user_model/user_data.dart';
import 'package:doc_app/features/auth/data/models/user_model/user_model.dart';
import 'package:doc_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:doc_app/features/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDatasource, AuthLocalDatasource, NetworkInfo])
void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDatasource mockAuthRemoteDatasource;
  late MockAuthLocalDatasource mockAuthLocalDatasource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockAuthLocalDatasource = MockAuthLocalDatasource();
    mockAuthRemoteDatasource = MockAuthRemoteDatasource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthRepositoryImpl(
        remoteDatasource: mockAuthRemoteDatasource,
        localDatasource: mockAuthLocalDatasource,
        networrkInfo: mockNetworkInfo);
  });

  group('Login request', () {
    const String tEmail = "sali@gmail.com";
    const String tPassword = "sali@1234";
    const tUserModel = UserModel(
        message: "success",
        data: UserData(token: "qwer", username: "sali"),
        code: 200,
        status: true);
    const User tUser = tUserModel;
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
          'should return remote data when we call remote data source succesful',
          () async {
        //arrange
        when(mockAuthRemoteDatasource.login(email: tEmail, password: tPassword))
            .thenAnswer((realInvocation) async => tUserModel);
        //act
        final result =
            await repository.login(email: tEmail, password: tPassword);
        //assert
        expect(result, equals(const Right(tUser)));
      });
      test('should cache user when we call remote data source succesful',
          () async {
        //arrange
        when(mockAuthRemoteDatasource.login(email: tEmail, password: tPassword))
            .thenAnswer((realInvocation) async => tUserModel);

        //assert
        verify(
            mockAuthRemoteDatasource.login(email: tEmail, password: tPassword));
        verify(mockAuthLocalDatasource.cacheUser(
            userToCache: tUserModel.data!.token!));
      });
    });

    group('is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test('should return cache failure when there is no cached data',
          () async {
        //arrange
        when(mockAuthRemoteDatasource.login(email: tEmail, password: tPassword))
            .thenThrow(ServerFailure(message: "No Internet"));

        //act

        final result =
            await repository.login(email: tEmail, password: tPassword);

        //assert

        expect(result, equals(Left(ServerFailure(message: "No Internet"))));
      });
    });
  });

  group('register request', () {
    const String tEmail = "sali@gmail.com";
    const String tPassword = "sali@1234";
    const String tPhone = "010";
    const String tName = "sali";
    const tUserModel = UserModel(
        message: "success",
        data: UserData(token: "qwer", username: "sali"),
        code: 200,
        status: true);
    const User tUser = tUserModel;
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
          'should return remote data when we call remote data source succesful',
          () async {
        //arrange
        when(mockAuthRemoteDatasource.register(
                email: tEmail, password: tPassword, phone: tPhone, name: tName))
            .thenAnswer((realInvocation) async => tUserModel);
        //act
        final result = await repository.register(
            email: tEmail, password: tPassword, phone: tPhone, name: tName);
        //assert
        expect(result, equals(const Right(tUser)));
      });
      test('should cache user when we call remote data source succesful',
          () async {
        //arrange
        when(mockAuthRemoteDatasource.register(
                email: tEmail, password: tPassword, phone: tPhone, name: tName))
            .thenAnswer((realInvocation) async => tUserModel);

        //assert
        verify(mockAuthRemoteDatasource.register(
            email: tEmail, password: tPassword, phone: tPhone, name: tName));
        verify(mockAuthLocalDatasource.cacheUser(
            userToCache: tUserModel.data!.token!));
      });
    });

    group('is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test('should return cache failure when there is no cached data',
          () async {
        //arrange
        when(mockAuthRemoteDatasource.register(
                email: tEmail, password: tPassword, phone: tPhone, name: tName))
            .thenThrow(ServerFailure(message: "No Internet"));

        //act

        final result = await repository.register(
            email: tEmail, password: tPassword, phone: tPhone, name: tName);

        //assert

        expect(result, equals(Left(ServerFailure(message: "No Internet"))));
      });
    });
  });
}
