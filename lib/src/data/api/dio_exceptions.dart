import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:fas_mobile_app/src/data/model/error_model.dart';
// import 'dart:convert';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleStatusError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleStatusError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      // return error['message'];
      // case 500:
      //   return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  /// call this method from api repo to handle the error
  static String handleError(DioError e) {
    final errorMessage = DioExceptions.fromDioError(e).toString();
    debugPrint(errorMessage);
    if (e.type == DioErrorType.response && e.response?.statusCode != 404) {
      //@todo fix this
      // ErrorModel error =
      //     ErrorModel.fromJson(jsonDecode(e.response.toString()));
      // debugPrint(error.errorMessage.toString());
      // return error.errorMessage.toString();
    }
    return 'Not Found';
  }

  @override
  String toString() => message;
}
