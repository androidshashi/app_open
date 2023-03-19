import 'dart:convert';

import 'package:app_open/src/data/api/api_service.dart';
import 'package:app_open/src/data/api/dio_exceptions.dart';
import 'package:app_open/src/data/model/create_short_link_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepo {
  final ApiService apiService;
  HomeRepo(this.apiService);

  Future<Either<String, CreateShortLinkResponseModel>> generateLink(String url) async {
    try {
      var response = await apiService.generateLink(url);
      CreateShortLinkResponseModel model = CreateShortLinkResponseModel.fromJson(jsonDecode(response.toString()));
      return right(model);
    } on DioError catch (e) {
      var error = DioExceptions.handleError(e);
      return left(error);
    }
  }
}
