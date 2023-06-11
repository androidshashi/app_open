import 'package:app_open/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(
    { required String message,  bool success=true}) {
  Get.snackbar(success?AppLocalization.success:AppLocalization.error, message,
      colorText: Colors.white,
      backgroundGradient:
           LinearGradient(colors: [success ?Colors.green : Colors.red, Colors.black38]),
      borderRadius: 5,
      icon: Icon(
        success ? Icons.check : Icons.close,
        color: Colors.white,
      ));
}
