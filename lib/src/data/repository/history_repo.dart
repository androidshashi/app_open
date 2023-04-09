import 'dart:convert';

import 'package:app_open/src/data/api/api_service.dart';
import 'package:app_open/src/data/api/dio_exceptions.dart';
import 'package:app_open/src/data/model/create_short_link_response_model.dart';
import 'package:app_open/storage/history_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HistoryRepo {
  final ApiService apiService;
  HistoryRepo(this.apiService);
  Box? historyBox;

  ///------------Get generated list from hive storage---------------------------------
  // void saveLikeToHive() async {
  //   try {
  //
  //   } on DioError catch (e) {
  //     var error = DioExceptions.handleError(e);
  //     return left(error);
  //   }
  // }

  ///----------------------------------Open history box---------------------------
  Future<Either<String,Box>> initHiveAndOpenHistoryBox() async {
    try{

      var dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      if(!Hive.isAdapterRegistered(1)){
        Hive.registerAdapter(HistoryModelAdapter());
      }
      historyBox = historyBox?? await Hive.openBox('historyBox');
      return Either.right(historyBox!);
    }catch (e){
      return Either.left("History Not Found:${e.toString()}");
    }

  }
}
