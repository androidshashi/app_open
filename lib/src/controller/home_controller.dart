import 'package:app_open/src/data/api/dio_client.dart';
import 'package:app_open/src/data/api/service_locator.dart';
import 'package:app_open/src/data/repository/history_repo.dart';
import 'package:app_open/src/data/repository/home_repo.dart';
import 'package:app_open/src/views/generated_screen/generated_screen.dart';
import 'package:app_open/storage/history_model.dart';
import 'package:app_open/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

///batchController : use this controller for batch list related
class HomeController extends GetxController {
  //----------Repository-------
  final _homeRepo = getIt<HomeRepo>();
  final _hisRepo = getIt<HistoryRepo>();

  final urlInputEditingController = TextEditingController().obs;

  final generatedUrl = "".obs;

  var isLoading = false.obs;

  ///-----------------------------------Validate text field url--------------------------
  String? validateInputUrl(String? value){
    if (value == null || value.isEmpty) {
      return pleaseEnterYourUrl;
    }
    if (!value.isURL) {
      return pleaseEnterValidUrl;
    }
    return null;
  }

///------------create a new app opener link function----------------------------//
  void generateLink() async {
    isLoading.value = true;
    var response =
        await _homeRepo.generateLink(urlInputEditingController.value.text);
    response.fold((errorMsg) {
      Fluttertoast.showToast(msg: errorMsg);
      isLoading.value = false;
    }, (model) {
      Fluttertoast.showToast(msg: linkGenerated);
      debugPrint("Success");
      generatedUrl.value = "${Endpoints.webUrl}/${model.urlData?.type}/${model.urlData?.shortCode}";
      isLoading.value = false;
      debugPrint("-------Added url:${generatedUrl.value}, type:${model.urlData?.type}");
      addHistory(HistoryModel(
        longUrl: model.urlData?.longUrl,
        hits: model.urlData?.hits?.toInt(),
        shortUrl: generatedUrl.value,
        type: model.urlData?.type
      ));
      ///Go to generated screen
      Get.to(()=> GeneratedScreen());
    });
  }

  ///-----------------------------add data to history box-----------------------
  void addHistory(HistoryModel historyModel){
    _hisRepo.historyBox?.add(historyModel);
  }
}
