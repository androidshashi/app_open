import 'package:app_open/src/data/api/service_locator.dart';
import 'package:app_open/src/data/repository/home_repo.dart';
import 'package:app_open/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

///batchController : use this controller for batch list related
class HomeController extends GetxController {
  //----------Repository-------
  final _homeRepo = getIt<HomeRepo>();

  final urlInputEditingController = TextEditingController().obs;

  var isLoading = false.obs;

  ///--Get url list
  void batch() async {
    // isLoading.value = true;
    // debugPrint("----------- Batch Controller : getBatchList ----------------");
    // var response = await _homeRepo.getBatchList();
    // response.fold((l) {
    //   debugPrint(l);
    // }, (model) {
    //   isLoading.value = false;
    //   debugPrint("Success");
    // });
  }

//------------create a new app opener link function----------------------------//
  void generateLink() async {
    isLoading.value = true;
    var response =
        await _homeRepo.generateLink(urlInputEditingController.value.text);
    response.fold((errorMsg) {
      Fluttertoast.showToast(msg: errorMsg);
      isLoading.value = false;
    }, (model) {
      Fluttertoast.showToast(msg: StringConstants.linkGenerated);
      debugPrint("Success");
      isLoading.value = false;
    });
  }
}
