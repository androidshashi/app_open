import 'package:app_open/src/controller/home_controller.dart';
import 'package:app_open/src/views/ad/banner_ad_widget.dart';
import 'package:app_open/src/views/custom_widgets/custom_widgets.dart';
import 'package:app_open/src/views/custom_widgets/custom_appbar.dart';
import 'package:app_open/src/views/custom_widgets/view_history_button.dart';
import 'package:app_open/theme/app_theme.dart';
import 'package:app_open/utils/image_constants.dart';
import 'package:app_open/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GeneratedScreen extends StatelessWidget {
  GeneratedScreen({Key? key}) : super(key: key);
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: SafeArea(
        child: Container(
          color: Get.theme.primaryColorLight.withOpacity(0.5),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(
                  height: 50.h,
                ),
                _buildGeneratedUrlContainer(),
                SizedBox(
                  height: 5.h,
                ),
                CopyTextButton(text:_controller.generatedUrl.value),
               const ViewHistoryButton(),
                BannerAdWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
  ///build generated container
  _buildGeneratedUrlContainer() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Get.theme.primaryColor, width: 0.5.w)),
        child: Obx(
          () =>  Text(
            _controller.generatedUrl.value,
            maxLines: 1,
            style: TextStyle(
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
        ));
  }
}
