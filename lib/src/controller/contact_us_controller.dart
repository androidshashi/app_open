import 'dart:developer';

import 'package:app_open/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

///batchController : use this controller for batch list related
class ContactUsController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> contentController = TextEditingController().obs;

  ///-----------------------------------Validate text field url--------------------------
  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalization.pleaseFillThisField;
    }
   return null;
  }
  Future<void> launchMailApp() async {
    try {
      MethodChannel _channel = MethodChannel('AppOpenChannel');
      String email = "help@appopen.me";
      var response = await _channel
          .invokeMethod('sendMail', {'email': email, 'name':nameController.value.text, 'message':contentController.value.text});
      Fluttertoast.showToast(msg: response);
    } catch (e) {
      log("createContact Error => ${e.toString()}");
      const SnackBar(
        content: Text("Something Went Wrong \nMessage has not been sent!"),
      );
    }
  }
}
