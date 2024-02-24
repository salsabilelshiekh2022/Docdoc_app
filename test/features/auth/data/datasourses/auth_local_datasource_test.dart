import 'package:doc_app/core/database/cache/cache_helper.dart';
import 'package:doc_app/features/auth/data/datasourses/auth_local_datasource.dart';
import 'package:doc_app/features/auth/data/models/user_model/user_data.dart';
import 'package:doc_app/features/auth/data/models/user_model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_local_datasource_test.mocks.dart';

@GenerateMocks([CacheHelper])
void main() {
  late AuthLocalDatasource datasource;
  late MockCacheHelper mockCacheHelper;

  setUp(() {
    mockCacheHelper = MockCacheHelper();
    datasource = AuthLocalDatasourceImpl(cacheHelper: mockCacheHelper);
  });
  test('Should call cacheHelper class to cache user', () async {
    //arrange
    const tUser = UserModel(
        message: "success",
        data: UserData(
          token: "qwer",
          username: "sali",
        ),
        code: 200,
        status: true);

    when(mockCacheHelper.cacheData(key: 'CacheUser', value: tUser.data!.token!))
        .thenAnswer((_) async => Future.value(true));

    //act

    await datasource.cacheUser(userToCache: tUser.data!.token!);

    //assert
    final expextedJsonString = tUser.data!.token;
    verify(
        mockCacheHelper.cacheData(key: 'CacheUser', value: expextedJsonString));
  });
}
