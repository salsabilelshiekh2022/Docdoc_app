import 'dart:convert';

import 'package:doc_app/features/auth/data/models/user_model/user_data.dart';
import 'package:doc_app/features/auth/data/models/user_model/user_model.dart';
import 'package:doc_app/features/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture_reader.dart';

void main() {
  const tUserData = UserData(
    token: "qwer",
    username: "sali",
  );
  const tUser =
      UserModel(code: 200, message: "success", status: true, data: tUserData);

  test('user model ...', () async {
    //assert
    expect(tUser, isA<User>());
  });
  group('to json ', () {
    test('should return a JSON map containing the proper data', () async {
      //act
      final result = tUser.toJson();
      //assert
      final expectedMap = {
        "message": "success",
        "data": {"token": "qwer", "username": "sali"},
        "status": true,
        "code": 200
      };
      expect(result, expectedMap);
    });
  });

  group('from json', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('user.json'));
        // act
        final result = UserModel.fromJson(jsonMap);
        // assert
        expect(result, tUser);
      },
    );
  });
}
