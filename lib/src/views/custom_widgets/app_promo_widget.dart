import 'package:app_open/src/controller/home_controller.dart';
import 'package:app_open/utils/app_localization.dart';
import 'package:app_open/utils/extension_methods.dart';
import 'package:app_open/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppPromoWidget extends StatelessWidget {
  AppPromoWidget({Key? key}) : super(key: key);
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListTile(
          onTap: () {
            "https://play.google.com/store/apps/details?id=${_controller.appPromoModel.value?.appData?.appPackageName}"
                .launch(launchOutSide: true);
          },
          leading: _controller.appPromoModel.value?.appData?.appIconUrl == null
              ? Image.asset(AppImages.appLogo)
              : Image.network(
                  _controller.appPromoModel.value!.appData!.appIconUrl!),
          title: Text(_controller.appPromoModel.value?.appData?.appTitle ?? ""),
          subtitle: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: Get.theme.primaryColorLight.withOpacity(0.2)
              ),
              padding: EdgeInsets.all(3.w),
              child: Text(AppLocalization.install)),
          trailing: Container(
            color: Get.theme.highlightColor,
            child: Text(AppLocalization.ad),
          ),
        ));
  }
}
