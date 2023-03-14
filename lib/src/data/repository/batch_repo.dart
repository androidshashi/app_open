import 'dart:convert';

import 'package:app_open/src/data/api/api_service.dart';
import 'package:app_open/src/data/api/dio_exceptions.dart';
import 'package:app_open/src/data/model/bach_list_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

class BatchRepo {
  final ApiService apiService;
  BatchRepo(this.apiService);

  Future<Either<String, bool>> createNewBatch(data) async {
    try {
      var response = await apiService.createNewBatch(data);
      debugPrint(response.toString());
      return right(true);
    } on DioError catch (e) {
      var error = DioExceptions.handleError(e);
      return left(error);
    }
  }

  Future<Either<String, BatchlistResponseModel>> getBatchList() async {
    try {
      var response = await apiService.batchList();

      //  print(response);
      BatchlistResponseModel batchListModel =
          BatchlistResponseModel.fromJson(json.decode(response.toString()));
      debugPrint(batchListModel.toString());
      return right(batchListModel);
    } on DioError catch (e) {
      var error = DioExceptions.handleError(e);
      return left(error);
    }
  }
}
