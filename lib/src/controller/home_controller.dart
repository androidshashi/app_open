import 'package:app_open/src/data/api/service_locator.dart';
import 'package:app_open/src/data/model/bach_list_response_model.dart';
import 'package:app_open/src/data/repository/batch_repo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

///batchController : use this controller for batch list related
class HomeController extends GetxController {
  //----------Repository-------
  final batchRepo = getIt<BatchRepo>();

  Rxn<BatchlistResponseModel> batchListResponseModel = Rxn();
  var isLoading = false.obs;

  ///--Get batch list
  void batch() async {
    isLoading.value = true;
    debugPrint("----------- Batch Controller : getBatchList ----------------");
    var response = await batchRepo.getBatchList();
    response.fold((l) {
      debugPrint(l);
    }, (model) {
      isLoading.value = false;
      batchListResponseModel.value = model;
      debugPrint("Success");
    });
  }



  //-------------create batch ----------------------------//
  var batchNameTextEditingController = TextEditingController().obs;
  var circleNameTextEditingController = TextEditingController().obs;
  var durationTextEditingController = TextEditingController().obs;
  var amountTextEditingController = TextEditingController().obs;
  var currencyTextEditingController = TextEditingController().obs;
  var dateInput = TextEditingController().obs;
  var circleId = "".obs;
  var date = "".obs;
  var circleNameList = ''.obs;
  var currencyName = ''.obs;

//------------create a new circle function----------------------------//
  void createBatch() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString("userId");
    isLoading.value = true;
    if (batchNameTextEditingController.value.text.toString() == "" ||
        circleId.value == "" ||
        durationTextEditingController.value.text == "" ||
        amountTextEditingController.value.text == "" ||
        currencyName.value == "" ||
        dateInput.value.text == "") {
      Fluttertoast.showToast(
          msg: "Fill all fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      isLoading.value = false;
    } else {
      isLoading.value = true;
      var response = await batchRepo.createNewBatch({
        "inBatchName": batchNameTextEditingController.value.text.toString(),
        "inBatchStartDate": dateInput.value.text.toString(),
        "inBatchAmount": amountTextEditingController.value.text.toString(),
        "inBatchCurrency": currencyName.value,
        "inBatchSize": durationTextEditingController.value.text.toString(),
        "inCircleId": circleId.value.toString(),
        "inUserId": userId.toString()
      });
      response.fold((errorMsg) {
        Fluttertoast.showToast(msg: errorMsg);
        isLoading.value = false;
      }, (success) {
        Fluttertoast.showToast(msg: "Batch Created");
        debugPrint("Success");
        isLoading.value = false;
      });
    }
  }
}
