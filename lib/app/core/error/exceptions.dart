import 'dart:io';

import 'package:dio/dio.dart';

import '../network/api_response.dart';

class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException(this.message, {this.statusCode});

  static ServerException handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return ServerException("Request timed out",
            statusCode: error.response?.statusCode);
      case DioErrorType.connectionTimeout:
        return ServerException("Request timed out",
            statusCode: error.response?.statusCode);
      case DioErrorType.receiveTimeout:
        return ServerException("Request timed out",
            statusCode: error.response?.statusCode);
      case DioErrorType.sendTimeout:
        return ServerException("Request timed out",
            statusCode: error.response?.statusCode);
      case DioErrorType.unknown:
        if (error.response?.data is Map<String, dynamic>) {
          var errorResponse =
          ApiResponse.fromJson(error.response?.data, (json) => Object());
          return ServerException(errorResponse.messages ?? "",
              statusCode: error.response?.statusCode);
        } else {
          return ServerException("An unexpected problem has occurred",
              statusCode: error.response?.statusCode);
        }
      // case DioErrorType.other:
      //   if (error.error is SocketException) {
      //     return ServerException("Can't connect to the internet",
      //         statusCode: error.response?.statusCode);
      //   } else {
      //     return ServerException("An unexpected problem has occurred",
      //         statusCode: error.response?.statusCode);
      //   }
      default:
        return ServerException("An unexpected problem has occurred",
            statusCode: error.response?.statusCode);
    }
  }
}
