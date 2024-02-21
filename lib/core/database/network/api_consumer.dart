abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  });
}
