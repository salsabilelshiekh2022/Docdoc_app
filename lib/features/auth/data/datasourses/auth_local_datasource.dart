import 'package:doc_app/core/database/cache/cache_helper.dart';

abstract class AuthLocalDatasource {
  Future<void> cacheUser({required String userToCache});
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final CacheHelper cacheHelper;

  AuthLocalDatasourceImpl({required this.cacheHelper});

  @override
  Future<void> cacheUser({required String userToCache}) async {
    await cacheHelper.cacheData(key: 'CacheUser', value: userToCache);
  }
}
