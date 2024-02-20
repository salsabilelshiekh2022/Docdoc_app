import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'Bad certification with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'NoInternet connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            message: 'Opps there was an error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
          message: 'Your request was not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure(
          message: 'There is a problem with server, Please try later!');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message: response['error']['message']);
    } else {
      return ServerFailure(message: 'There was an error, Please try again!');
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}
