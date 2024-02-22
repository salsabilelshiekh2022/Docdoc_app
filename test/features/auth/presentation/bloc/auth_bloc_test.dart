import 'package:dartz/dartz.dart';
import 'package:doc_app/core/errors/failures.dart';
import 'package:doc_app/features/auth/data/models/user_model/user_data.dart';
import 'package:doc_app/features/auth/data/models/user_model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:doc_app/features/auth/domain/usecases/login.dart';
import 'package:doc_app/features/auth/domain/usecases/register.dart';
import 'package:doc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mockito/mockito.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([Login, Register])
void main() {
  late AuthBloc authBloc;
  late MockLogin mockLogin;
  late MockRegister mockRegister;

  setUp(() {
    mockLogin = MockLogin();
    mockRegister = MockRegister();
    authBloc = AuthBloc(login: mockLogin, register: mockRegister);
  });
  group('login', () {
    test('Should emit [loading, success] when user is login successfully',
        () async {
      const user = UserModel(
          message: "success",
          data: UserData(token: "qwer", username: "sali"),
          code: 200,
          status: true);
      when(mockLogin.call(any)).thenAnswer((_) async => const Right(user));
      final expected = [
        LoginLoading(),
        LoginSuccess(),
      ];
      expectLater(authBloc.stream, emitsInOrder(expected));
      authBloc.add(const UserLogin(email: "", password: ""));
    });

    test('Should emit [loading, error] when user is login unSuccessfully',
        () async {
      when(mockLogin.call(any)).thenAnswer((_) async => Left(
          ServerFailure(message: 'Opps! there was an error try again later')));
      final expected = [
        LoginLoading(),
        const LoginError(message: 'Opps! there was an error try again later'),
      ];
      expectLater(authBloc.stream, emitsInOrder(expected));
      authBloc.add(const UserLogin(email: "", password: ""));
    });
  });

  group('register', () {
    test('Should emit [loading, success] when  user is register successfully',
        () async {
      const user = UserModel(
          message: "success",
          data: UserData(token: "qwer", username: "sali"),
          code: 200,
          status: true);
      when(mockRegister.call(any)).thenAnswer((_) async => const Right(user));
      final expected = [
        RegisterLoading(),
        RegisterSuccess(),
      ];
      expectLater(authBloc.stream, emitsInOrder(expected));
      authBloc.add(
          const UserRegister(email: "", password: "", phone: "", name: ""));
    });

    test('Should emit [loading, error] when user is register unSuccessfully',
        () async {
      when(mockRegister.call(any)).thenAnswer((_) async => Left(
          ServerFailure(message: 'Opps! there was an error try again later')));
      final expected = [
        RegisterLoading(),
        const RegisterError(
            message: 'Opps! there was an error try again later'),
      ];
      expectLater(authBloc.stream, emitsInOrder(expected));
      authBloc.add(
          const UserRegister(email: "", password: "", phone: "", name: ""));
    });
  });
}
