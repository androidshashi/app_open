import 'package:app_open/src/data/api/dio_client.dart';
import 'package:app_open/src/data/api/service_locator.dart';
import 'package:app_open/src/data/repository/history_repo.dart';
import 'package:app_open/src/data/repository/home_repo.dart';
import 'package:app_open/src/views/generated_screen.dart';
import 'package:app_open/storage/history_model.dart';
import 'package:app_open/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

///batchController : use this controller for batch list related
class HistoryController extends GetxController {

  //----------Repository-------
  final _hisRepo = getIt<HistoryRepo>();
  Box? historyBox;
  RxBool isLoading = false.obs;
  RxList<dynamic> historyList = RxList();

  ///--Get history list

  @override
  void onInit() {

    initHive();

    super.onInit();
  }

  ///-------------------------init hive---------------------------------
  void initHive() async {
    isLoading(true);
    var response = await _hisRepo.initHiveAndOpenHistoryBox();
    response.fold((errorMessage) {
      isLoading(false);
      debugPrint(errorMessage);
    }, (box) {
      isLoading(false);
      historyBox = box;
      getHistory();
    });
  }

  ///-----------------------------add data to history box-----------------------
  void addHistory(HistoryModel historyModel){
    historyBox?.add(historyModel);
  }

  ///-----------------------------get all data from history box-----------------------
  void getHistory(){
    Map<dynamic, dynamic>? raw = historyBox?.toMap();
    List? list = raw?.values.toList();
    debugPrint("-------------------History Count:${list?.length??0}");
    historyList.value = list!;
  }

}
