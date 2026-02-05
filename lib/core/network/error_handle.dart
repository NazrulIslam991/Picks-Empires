import 'dart:developer' as dev;

import 'package:dio/dio.dart';

class ErrorHandle {
  static String handleDioError(DioException e) {
    dev.log(
      '================== DIO ERROR ==================',
      name: 'API_ERROR',
    );
    dev.log('Type: ${e.type}', name: 'API_ERROR');
    dev.log('Path: ${e.requestOptions.path}', name: 'API_ERROR');

    String errorMessage = "Something went wrong";

    switch (e.type) {
      case DioExceptionType.badCertificate:
        errorMessage = "Bad certificate. Please try again.";
        break;

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final data = e.response?.data;

        dev.log('Status Code: $statusCode', name: 'API_ERROR');
        dev.log('Response Data: $data', name: 'API_ERROR');

        if (data is Map<String, dynamic> && data['message'] != null) {
          errorMessage = data['message'].toString();
        } else {
          errorMessage = "Server error: $statusCode";
        }
        break;

      case DioExceptionType.connectionError:
        errorMessage = "Connection error. Please check your internet.";
        break;

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage = "Timeout error. Please try again.";
        break;

      case DioExceptionType.cancel:
        errorMessage = "Request was cancelled.";
        break;

      case DioExceptionType.unknown:
      default:
        errorMessage = "Unknown error occurred. Please try again.";
        break;
    }

    dev.log('Final Message: $errorMessage', name: 'API_ERROR');
    dev.log(
      '================================================',
      name: 'API_ERROR',
    );

    return errorMessage;
  }
}
