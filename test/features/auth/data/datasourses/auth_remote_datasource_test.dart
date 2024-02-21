import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:doc_app/core/database/network/api_consumer.dart';
import 'package:doc_app/core/database/network/end_points.dart';
import 'package:doc_app/features/auth/data/datasourses/auth_remote_datasource.dart';
import 'package:doc_app/features/auth/data/models/user_model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture/fixture_reader.dart';
import 'auth_remote_datasource_test.mocks.dart';

@GenerateMocks([ApiConsumer])
void main() {
  late AuthRemoteDatasource datasource;
  late MockApiConsumer mockApi;

  setUp(() {
    mockApi = MockApiConsumer();
    datasource = AuthRemoteDatasourceImpl(api: mockApi);
  });

  const String tEmail = "sali@gmail.com";
  const String tPassword = "sali@1234";
  const String tPhone = "01012345678";
  const String tName = "sali";
  final tUserModel = UserModel.fromJson(json.decode(fixture('user.json')));
  test('Should return user if the login request is done', () async {
    //arrange
    when(mockApi.post(
            path: EndPoint.login,
            data: {"email": tEmail, "password": tPassword}))
        .thenAnswer((_) async => json.decode(fixture('user.json')));
    // act
    final result = await datasource.login(email: tEmail, password: tPassword);
    //assert
    expect(result, equals(Right(tUserModel)));
  });

  test('Should return user if the register request is done', () async {
    //arrange
    when(mockApi.post(path: EndPoint.register, data: {
      "email": tEmail,
      "password": tPassword,
      "phone": tPhone,
      "gender": 0,
      "name": tName,
      "password_confirmation": tPassword
    })).thenAnswer((_) async => json.decode(fixture('user.json')));
    // act
    final result = await datasource.register(
        email: tEmail, password: tPassword, name: tName, phone: tPhone);
    //assert
    expect(result, equals(Right(tUserModel)));
  });
}
