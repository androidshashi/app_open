import 'package:app_open/src/data/api/dio_client.dart';
import 'package:app_open/src/data/api/service_locator.dart';
import 'package:app_open/src/data/model/shortcode_info_model.dart';
import 'package:app_open/src/data/repository/history_repo.dart';
import 'package:app_open/src/data/repository/home_repo.dart';
import 'package:app_open/src/views/generated_screen/generated_screen.dart';
import 'package:app_open/src/views/history/short_code_info_screen.dart';
import 'package:app_open/storage/history_model.dart';
import 'package:app_open/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

///batchController : use this controller for batch list related
class SearchController extends GetxController {

  //----------Repository-------
  final _hisRepo = getIt<HistoryRepo>();
  RxBool isLoading = false.obs;
  Rx<ShortCodeInfoModel> shortCodeInfo = ShortCodeInfoModel().obs;
  Rx<TextEditingController> urlInputEditingController = TextEditingController().obs;


  ///-----------------------------------Validate text field url--------------------------
  String? validateInputUrl(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalization.pleaseEnterYourUrl;
    }
    if (!value.isURL) {
      return AppLocalization.pleaseEnterValidUrl;
    }
    if(value.startsWith("https://appopen.me/yt/") || value.startsWith("https://appopen.me/web/") || value.startsWith("https://appopen.me/ig/"))
    {
      return null;
    }else{
      return AppLocalization.pleaseEnterAppOpenUrl;
    }
  }

  String getTypeFromUrl(){
    return urlInputEditingController.value.text.split("/")[3]??"";
  }

  String getShortcodeFromUrl(){
    return urlInputEditingController.value.text.split("/")[4]??"";
  }

  void getShortCodeInfo(String shortCode, String type) async{
    isLoading(true);
    var response = await _hisRepo.shortCodeInfo(shortCode, type);
    response.fold((errorMessage) {
      isLoading(false);
      debugPrint(errorMessage);
    }, (model) {
      isLoading(false);
      shortCodeInfo(model);
    });
  }

}
