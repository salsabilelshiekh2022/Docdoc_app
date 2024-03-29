// Mocks generated by Mockito 5.4.4 from annotations
// in doc_app/test/features/auth/data/repositories/auth_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:doc_app/core/database/network/network_info.dart' as _i6;
import 'package:doc_app/features/auth/data/datasourses/auth_local_datasource.dart'
    as _i5;
import 'package:doc_app/features/auth/data/datasourses/auth_remote_datasource.dart'
    as _i3;
import 'package:doc_app/features/auth/data/models/user_model/user_model.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserModel_0 extends _i1.SmartFake implements _i2.UserModel {
  _FakeUserModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRemoteDatasource extends _i1.Mock
    implements _i3.AuthRemoteDatasource {
  MockAuthRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.UserModel> login({
    required dynamic email,
    required dynamic password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i4.Future<_i2.UserModel>.value(_FakeUserModel_0(
          this,
          Invocation.method(
            #login,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i4.Future<_i2.UserModel>);

  @override
  _i4.Future<_i2.UserModel> register({
    required dynamic email,
    required dynamic password,
    required dynamic phone,
    required dynamic name,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [],
          {
            #email: email,
            #password: password,
            #phone: phone,
            #name: name,
          },
        ),
        returnValue: _i4.Future<_i2.UserModel>.value(_FakeUserModel_0(
          this,
          Invocation.method(
            #register,
            [],
            {
              #email: email,
              #password: password,
              #phone: phone,
              #name: name,
            },
          ),
        )),
      ) as _i4.Future<_i2.UserModel>);
}

/// A class which mocks [AuthLocalDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthLocalDatasource extends _i1.Mock
    implements _i5.AuthLocalDatasource {
  MockAuthLocalDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> cacheUser({required String? userToCache}) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheUser,
          [],
          {#userToCache: userToCache},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i6.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}
