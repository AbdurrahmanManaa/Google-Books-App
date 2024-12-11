import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server!');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve timeout with API server!');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate, Please try again!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request cancelled!');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection failed with API server!');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No internet connection!');
        }
        return ServerFailure('Oops there was an error ! Please try again');
      default:
        return ServerFailure('Connection timeout, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Request not found!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try again!');
    } else {
      return ServerFailure('Unexpected error, Please try again!');
    }
  }
}
